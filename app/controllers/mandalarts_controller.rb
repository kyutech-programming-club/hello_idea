# frozen_string_literal: true

require 'rexml/document'
require 'json'
require 'rubygems'
require 'faraday'
require 'faraday_middleware'

class MandalartsController < ApplicationController
  before_action :authorize, only: %i[index new create edit update]

  def index
    @simple_mandals = current_user.simple_mandals
  end

  def show
    @simple_mandal = SimpleMandal.find(params[:id])
  end

  def new
    @simple_mandal = SimpleMandal.new
  end

  def create
    @simple_mandal = current_user.simple_mandals.build(simple_mandal_params)
    @simple_mandal.save
    (1..9).each do |left_num|
      (1..9).each do |right_num|
        cell = "elem_#{left_num}_#{right_num}"
        next if simple_mandal_params[cell].nil?

        word = Word.new
        word.word = simple_mandal_params[cell]
        word.save
      end
    end
    flash[:success] = 'マンダラートを保存しました'
    redirect_to edit_mandalart_path(id: @simple_mandal)
  end

  def edit
    @simple_mandal = SimpleMandal.find(params[:id])
    @suggestions = params[:suggestions] unless params[:suggestions].nil?
    @sea = Sea.new
    @ideas = MandalIdea.where(simple_mandal_id: @simple_mandal.id)
  end

  def update
    @simple_mandal = SimpleMandal.find(params[:id])
    (1..9).each do |left_num|
      (1..9).each do |right_num|
        cell = "elem_#{left_num}_#{right_num}"
        next if simple_mandal_params[cell].nil?

        word = Word.new
        word.word = simple_mandal_params[cell]
        word.save
      end
    end
    if @simple_mandal.update(simple_mandal_params)
      flash[:success] = 'マンダラートを更新しました'
      redirect_to edit_mandalart_path(id: @simple_mandal)
    else
      render :edit
    end
  end

  def suggest
    keyword = params[:keyword]

    conn = Faraday::Connection.new(url: 'https://www.google.com') do |builder|
      builder.request :url_encoded
      builder.response :logger
      builder.response :json, content_type: /\bjson/
      builder.adapter Faraday.default_adapter
    end

    response = conn.get do |req|
      req.url '/complete/search'
      req.params['hl'] = 'en'
      req.params['q']  = keyword
      req.params['output'] = 'toolbar'
      req.params['json'] = true
    end

    @suggestions = []

    suggestion_xml = REXML::Document.new(response.body)
    suggestion_xml.elements['toplevel'].each do |elem|
      suggested_str = elem.elements['suggestion']['data']
      @suggestions << suggested_str
    end
  end

  private

  def simple_mandal_params
    params.require(:simple_mandal).permit(
      :elem_1_1, :elem_1_2, :elem_1_3,
      :elem_1_4, :elem_1_5, :elem_1_6,
      :elem_1_7, :elem_1_8, :elem_1_9,
      :elem_2_1, :elem_2_2, :elem_2_3,
      :elem_2_4, :elem_2_5, :elem_2_6,
      :elem_2_7, :elem_2_8, :elem_2_9,
      :elem_3_1, :elem_3_2, :elem_3_3,
      :elem_3_4, :elem_3_5, :elem_3_6,
      :elem_3_7, :elem_3_8, :elem_3_9,
      :elem_4_1, :elem_4_2, :elem_4_3,
      :elem_4_4, :elem_4_5, :elem_4_6,
      :elem_4_7, :elem_4_8, :elem_4_9,
      :elem_5_1, :elem_5_2, :elem_5_3,
      :elem_5_4, :elem_5_5, :elem_5_6,
      :elem_5_7, :elem_5_8, :elem_5_9,
      :elem_6_1, :elem_6_2, :elem_6_3,
      :elem_6_4, :elem_6_5, :elem_6_6,
      :elem_6_7, :elem_6_8, :elem_6_9,
      :elem_7_1, :elem_7_2, :elem_7_3,
      :elem_7_4, :elem_7_5, :elem_7_6,
      :elem_7_7, :elem_7_8, :elem_7_9,
      :elem_8_1, :elem_8_2, :elem_8_3,
      :elem_8_4, :elem_8_5, :elem_8_6,
      :elem_8_7, :elem_8_8, :elem_8_9,
      :elem_9_1, :elem_9_2, :elem_9_3,
      :elem_9_4, :elem_9_5, :elem_9_6,
      :elem_9_7, :elem_9_8, :elem_9_9
    )
  end
end
