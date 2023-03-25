class Job < ApplicationRecord
    has_many :job_applications, dependent: :destroy
    belongs_to :company
    has_many :skills
    def posted_time
        self.created_at.strftime("%m-%d-%Y") 
    end

    def post_test
        self.created_at.to_date
    end

    def application_count
        self.job_applications.count
    end
    
end

# how to created ruby method of formatted time?
# Model.created_at.strftime("%FT%T")


# %F - The ISO 8601 date format (%Y-%m-%d %I %M %S) 
# %T - 24-hour time (%H:%M:%S)


# Date (Year, Month, Day):
#   %Y - Year with century (can be negative, 4 digits at least)
#           -0001, 0000, 1995, 2009, 14292, etc.
#   %C - year / 100 (round down.  20 in 2009)
#   %y - year % 100 (00..99)

#   %m - Month of the year, zero-padded (01..12)
#           %_m  blank-padded ( 1..12)
#           %-m  no-padded (1..12)
#   %B - The full month name (``January'')
#           %^B  uppercased (``JANUARY'')
#   %b - The abbreviated month name (``Jan'')
#           %^b  uppercased (``JAN'')
#   %h - Equivalent to %b

#   %d - Day of the month, zero-padded (01..31)
#           %-d  no-padded (1..31)
#   %e - Day of the month, blank-padded ( 1..31)

#   %j - Day of the year (001..366)

# Time (Hour, Minute, Second, Subsecond):
#   %H - Hour of the day, 24-hour clock, zero-padded (00..23)
#   %k - Hour of the day, 24-hour clock, blank-padded ( 0..23)
#   %I - Hour of the day, 12-hour clock, zero-padded (01..12)
#   %l - Hour of the day, 12-hour clock, blank-padded ( 1..12)
#   %P - Meridian indicator, lowercase (``am'' or ``pm'')
#   %p - Meridian indicator, uppercase (``AM'' or ``PM'')

#   %M - Minute of the hour (00..59)

#   %S - Second of the minute (00..59)

#   %L - Millisecond of the second (000..999)
#   %N - Fractional seconds digits, default is 9 digits (nanosecond)
#           %3N  millisecond (3 digits)
#           %6N  microsecond (6 digits)
#           %9N  nanosecond (9 digits)
#           %12N picosecond (12 digits)




#Source: https://stackoverflow.com/questions/22255476



