def openssh_server_options
  options = node['openssh']['server'].dup.reject{|k,v| k=='match'}.sort.reject { |key, value| key == 'port' }
  unless node['openssh']['server']['port'].nil?
    port = node['openssh']['server'].select { |key| key == 'port' }.to_a
    options.unshift(*port)
  end
  options
end
