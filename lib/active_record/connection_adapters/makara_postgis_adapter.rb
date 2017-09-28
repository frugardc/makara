require 'active_record/connection_adapters/makara_abstract_adapter'
require 'active_record/connection_adapters/postgis_adapter'

if ActiveRecord::VERSION::MAJOR >= 4

  module ActiveRecord
    module ConnectionHandling
      def makara_postgis_connection(config)
        ActiveRecord::ConnectionAdapters::MakaraPostgisAdapter.new(config)
      end
    end
  end

else

  module ActiveRecord
    class Base
      def self.makara_postgis_connection(config)
        ActiveRecord::ConnectionAdapters::MakaraPostgisAdapter.new(config)
      end
    end
  end

end

<<<<<<< HEAD
module ActiveRecord
  module ConnectionAdapters
    class MakaraPostgisAdapter < ActiveRecord::ConnectionAdapters::MakaraAbstractAdapter

      class << self
        def visitor_for(*args)
          ActiveRecord::ConnectionAdapters::MakaraPostgisAdapter.visitor_for(*args)
        end
=======

module ActiveRecord
  module ConnectionAdapters
    class MakaraPostgisAdapter < ActiveRecord::ConnectionAdapters::MakaraAbstractAdapter
      def self.visitor_for(*args)
        ActiveRecord::ConnectionAdapters::PostGISAdapter.visitor_for(*args)
>>>>>>> 9a441f3c38a15a47f6390dcff446fb1a21548399
      end

      protected

      def active_record_connection_for(config)
        ::ActiveRecord::Base.postgis_connection(config)
      end
<<<<<<< HEAD

    end
  end
end
=======
    end
  end
end
>>>>>>> 9a441f3c38a15a47f6390dcff446fb1a21548399
