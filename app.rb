require 'sinatra'
require "sinatra/activerecord"
require_relative 'models/chore'
require_relative 'models/user'
require 'json'
require 'pry'

# Dir['app/**/*.rb'].each { |file| require_relative file }
# set :views, 'app/views'
# set :environment, :development

get '/' do
  redirect '/index'
end

get '/index' do
  @users = User.all.order(id: :asc)
  erb :'/schedule/index'
end

post '/index/create' do

  @user = User.new(name: "#{params[:name]}", phone_number: "#{params[:phone]}")

  if @user.valid?
    @user.save
  end

  @chore = Chore.new(name: "#{params[:chore]}")
  @chore.user = @user

  if @chore.valid?
    @chore.save
  end

  response = "<li><span class='lists callout'>#{@user.name}</span> <span class='lists callout'>#{@user.chores.first.name}</span></li>"

  response
end

post '/index/cycle' do
  @chores = Chore.all.order(id: :asc)
  response = ""
  user_ids = []

  @chores.each do |chore|
    user_ids << chore.user.id
  end

  ############### FIX THIS ################
  @chores.each_with_index do |chore, index|
    if chore.user.id == user_ids[-1]
      chore.update_attribute(:user_id, user_ids[0])

      response += "<li><span class='lists callout'>#{chore.user.name}</span> <span class='lists callout'>#{chore.name}</span></li>"
    else
      chore.update_attribute(:user_id, user_ids[index + 1]) # this needs to be next User not Chore

      response += "<li><span class='lists callout'>#{chore.user.name}</span> <span class='lists callout'>#{chore.name}</span></li>"
    end
  end

  response
end

# remove if/end logic from span in index
