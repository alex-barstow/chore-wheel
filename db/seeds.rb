require 'sinatra'
require "sinatra/activerecord"

User.create(name: 'Alex', phone_number: '5087338306')
User.create(name: 'Julia', phone_number: '6176996240')
User.create(name: 'Patrick', phone_number: '2022105352')

Chore.create(name: 'Dishes', user_id: 1)
Chore.create(name: 'Counters', user_id: 2)
Chore.create(name: 'Trash', user_id: 3)
