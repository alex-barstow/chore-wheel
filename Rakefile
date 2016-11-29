require "./app"
require "sinatra/activerecord/rake"
require "rspec/core/rake_task"
require "twilio-ruby"

begin
  Rake::Task["db:migrate"].enhance do
    Rake::Task["db:test:prepare"].invoke
  end
  RSpec::Core::RakeTask.new(:spec)
  task default: :spec
rescue LoadError
  puts "Please 'bundle', first."
end

task :send do
  account_sid = 'AC1794c1f1202a7aa3d98a6d25d4ec9665'
  auth_token = 'bacd3b85954d8cc9c9650458c6d12c24'

  # set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new account_sid, auth_token

  @client.account.messages.create(
    from: '+15082834493 ',
    to: '+15087338306',
    body: 'I just sent this from my command line - Alex'
  )
end
