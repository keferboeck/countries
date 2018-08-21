# countries
SQL feed for countries / continents and languages spoken

General
=======

Countries is based on <a href="https://github.com/annexare/Countries" target="_blank">Annexare Studio's country data SQL files</a>. We have extended the files by introducing a association table between countries and languages, for the purpose of simplification working with the data. To improve performance we work with ID's as primary keys instead of VARCHAR identifiers.

Ruby on Rails
=============

We also created seed files that can be used for Ruby on Rails. 

Here are the RoR migrations and models that are required:

    class CreateContinents < ActiveRecord::Migration[5.2]
      def change
        create_table :continents do |t|
          t.string :name, :null => false

          t.timestamps
        end
      end
    end

    class CreateCountries < ActiveRecord::Migration[5.2]
      def change
        create_table :countries do |t|
          t.string :code, :null => false
          t.string :name, :null => false
          t.string :native
          t.string :phone
          t.string :capital
          t.string :currency
          t.integer :continent_id, :null => false

          t.timestamps
        end
        add_index :countries, :code, unique: true
      end
    end

    class CreateCountryLanguages < ActiveRecord::Migration[5.2]
      def change
        create_table :country_languages do |t|
          t.integer :country_id, :null => false
          t.integer :language_id, :null => false

          t.timestamps
        end

        add_index :country_languages, [:country_id, :language_id], unique: true
      end
    end

    class CreateLanguages < ActiveRecord::Migration[5.2]
      def change
        create_table :languages do |t|
          t.string :code, :null => false
          t.string :name, :null => false
          t.string :native, :null => false, :default => ''
          t.boolean :rtl, :null => false, :default => false

          t.timestamps
        end

        add_index :languages, :code, unique: true
      end
    end

*models/continent.rb*

    class Continent < ApplicationRecord
      has_many :countries

      validates :name, presence: true, :uniqueness => true
    end
    
*models/country.rb*

    class Country < ApplicationRecord
      belongs_to :continent

      has_many :country_languages
      has_many :languages, through: :country_languages

      validates :code, presence: true, :uniqueness => true
      validates :name, presence: true
      validates :continent_id, presence: true
    end
    
*models/country_language.rb*

    class CountryLanguage < ApplicationRecord
      belongs_to :country
      belongs_to :language

      validates :country_id, presence: true
      validates :language_id, presence: true
    end
    
*modles/language.rb*

    class Language < ApplicationRecord
      has_many :country_languages
      has_many :countries, through: :country_languages

      validates :code, presence: true, :uniqueness => true
    end



