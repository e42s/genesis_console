guard 'haml', :input => 'src/assets', :output => 'src/view' do
  watch %r{^src/assets/(.+\.html\.haml)$}
end

guard 'sass', :output => 'priv/static/' do
  watch %r{^src/assets/(.+\.s[ac]ss)$}
end

guard 'livereload' do
  watch(%r{priv/static/.+\.(js|css)$})
  watch(%r{src/view/.+\.html$})
end

guard 'coffeescript', :output => 'priv/static/', :bare => true, :hide_success => true do
  watch(%r{^src/assets/(.+\.coffee)$})
end

guard 'shell' do
  watch(/(.*)\.erl/) do |m|
    if system('rebar compile && rebar boss c=test_eunit')
      Notifier.notify("SUCCESS", :title => "Genesis Console")
    else
      Notifier.notify("ERROR", :title => "Genesis Console", :image => :failed)
    end
  end
end
