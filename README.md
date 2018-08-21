# countries
SQL feed for countries / continents and languages spoken

General
=======

Countries is based on <a href="https://github.com/annexare/Countries" target="_blank">Annexare Studio's country data SQL files</a>. We have extended the files by introducing a association table between countries and languages, for the purpose of simplification working with the data. To improve performance we work with ID's as primary keys instead of VARCHAR identifiers.

Ruby on Rails
=============

We also created seed files that can be used for Ruby on Rails. 

Here are the RoR migrations and models that are required:

