# Generate a csv from xls
# Create output for every sheet
# Usage: xls2csv </path/to/xlsfile.xls>

xlsx2csv () { 
if [ ! -f $1 ]; then
  echo "File '$1' not found."
  return 1
fi
if [ -z $2 ]; then
  echo "Usage: <file.xls> <sheet_prefix>"
  return 1
fi

ruby  <<EOF
  require 'rubygems'
  require 'roo'
  file      = "$1"
  xls = Excelx.new(file)
  xls.sheets.each { |s| 
    xls.default_sheet = s
      s=s.gsub(/\ /,'_')
      xls.to_csv("$2_#{s}.csv")
    }
    puts file
EOF
}


xls2csv () { 
if [ ! -f $1 ]; then
  echo "File '$1' not found."
  return 1
fi
if [ -z $2 ]; then
  echo "Usage: <file.xls> <sheet_prefix>"
  return 1
fi

ruby  <<EOF
  require 'rubygems'
  require 'roo'
  file      = "$1"
  xls = Excel.new(file)
  xls.sheets.each { |s| 
    xls.default_sheet = s
      s=s.gsub(/\ /,'_')
      xls.to_csv("$2_#{s}.csv")
    }
    puts file
EOF
}
