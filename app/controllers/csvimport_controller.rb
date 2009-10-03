class CsvimportController < ApplicationController
  require 'fastercsv'
  def csv_import 
       @parsed_file=CSV::Reader.parse(params[:dump][:file])
       n=0
       @parsed_file.each  do |row|
         print "row = #{row}"
       end
       flash.now[:message]="CSV Import Successful,  #{n} new records added to data base"
   end
end