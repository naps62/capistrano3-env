namespace :env do

  task :create do
    on roles :app do
      backend.create
    end
  end

  desc 'Shows the current dotenv configuration (optional argument specifies a single key to show)'
  task :get, [:key] do |task, args|
    on roles :app do
     config = backend.read
     if args[:key]
       config = { args[:key] => config[args[:key]] }
     end
     config.each do |key, val|
       puts "#{key}: #{val}"
     end
    end
  end

  desc 'Sets a dotenv key to a value'
  task :set, [:key, :val] do |task, args|
    on roles :app do
      config = backend.read
      config[args[:key]] = args[:val]
      backend.write(config)
    end
  end

  desc 'Deletes a key from the dotenv file'
  task :delete, [:key] do |task, args|
    on roles :app do
      config = backend.read
      config.delete args[:key] if args[:key]
      backend.write(config)
    end
  end

  def backend
    # TODO make this generic
    Capistrano::Env::Backend::Dotenv.new(self)
  end
end

namespace :load do
  task :defaults do
    set :config_backend, :dotenv
    set :config_file, '.env'
  end
end

module Capistrano
  module Env
    module Backend
      class Dotenv
        def initialize(context)
          @context = context
        end

        def create
          @context.execute :touch, filename
        end

        def read
          hashify(@context.capture :cat, filename)
        end

        def write(values)
          @context.execute :echo, "\"#{stringify(values)}\"", '>', filename
        end

        private

        def filename
          Pathname(shared_path).join(fetch(:config_file))
        end

        def hashify(string)
          values = string.split("\n").map do |line|
            line.split(/:|\n/, 2).map(&:strip)
          end
          values.reject(&:empty?)
          Hash[values]
        end

        def stringify(values)
          values.map { |key, val| "#{key}: #{val}" }.join("\n")
        end
      end
    end
  end
end
