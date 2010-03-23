$born=Time.parse("1977-10-03"); years=78
#$born=Time.parse("2008-10-27"); years=96
#$born=Time.parse("1981-01-15"); years=88
#$born=Time.parse("1984-04-15"); years=78
months=['J','f','m','a','m','j','j','a','s','o','n','d']
def this_month(n) ; ($born + n.months) > (Time.now.beginning_of_month) && ($born + n.months) < (Time.now.end_of_month) ; end
spent = ((Time.now - $born) / 60 / 60 / 24 / 30).to_i
chart = "LifeChart (super go)\n"
mpl=3*12
chart << "          "
mpl.times{|i| chart << months[(i+$born.month-1)%12]; chart << ' '}; 
chart << "\n"; 
(years*12).times do |i| 
	m=i+1
	chart << "%2d - %4d " % [($born+i.months).year-$born.year,($born+m.months).year] if i%mpl==0
	chart << (this_month(i) ? 'X' : '.')
	chart << ' '
	chart << "%4d - %2d\n" % [($born+i.months).year,($born+m.months).year-$born.year-1] if m%mpl==0
end
chart << "          "
mpl.times{|i| chart << months[(i+$born.month-1)%12]; chart << ' '}; 
chart << "\n%d months: %d (%.0f%%) lived: %d (%.0f%%) to go!" % [years*12, spent,spent.to_f/(years*12)*100,(years*12)-spent,((years*12)-spent).to_f/(years*12)*100]
puts chart
