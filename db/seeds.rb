# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

puts '>>> CREATE SLIDES'

Slide.create!(:english_text1 => "We Help All of Our MENA Clients Advertise on the Internet",
              :english_text2 => "<b>Experience</b>, <b>collaboration</b> and <b>advanced</b> tools makes Levant Digital the best in the Middle East.",
              :english_text3 => "Our goal is to provide our Mena and GCC customers with leading online marketing solutions that integrate all of your digital advertising needs.",
              :english_text4 => "Mr. Imad Jomaa",
              :english_text5 => "Chairman"
              )

Slide.create!(:english_text1 => "Levant Elevates Your Small Business to Create Results",
              :english_text2 => "Our marketing experts understand the ever changing landscape of online marketing and can help your business grow.",
              :english_text3 => "Small Business Solutions",
              :english_text4 => "<li>Flexible plans customized to your needs</li><li>Dedicated account manager</li><li>Daily Reporting and Optimization</li>",
              :english_text5 => "Get Started"
              )

Slide.create!(:english_text1 => "Strategic SEO Improves Organic Rankings And Traffic",
              :english_text2 => "Levant's partner, WPromote, optimized their newly designed website and preserved their organic rankings upon launch.",
              :english_text3 => "Their technical knowledge and commitment to service makes them an ideal partner!",
              :english_text4 => "Blake Mycoskie",
              :english_text5 => "Founder &amp; Chief Shoe Giver, TOMS"
              )

Slide.create!(:english_text1 => "First-Class Online Marketing With Results",
              :english_text2 => "Levant's parter, WPromote, developed a comprehensive marketing strategy for HP's expansive enterprise website to help capture additional sales leads.",
              :english_text3 => "A clear understanding of our enterprise site requirements was crucial to our site growth and ongoing optimization.",
              :english_text4 => "Charles McRoy",
              :english_text5 => "Marketing Director"
              )

Slide.create!(:english_text1 => "SEO Requires Real Creativity and Awareness",
              :english_text2 => "Levant's Partner, WPromote, helped transition the new Van's website to a more robust reporting platform to better understand consumer sentiment.",
              :english_text3 => "Using cutting edge reporting tools has greatly improved our understanding of what customers want.",
              :english_text4 => "Shawn Hunt",
              :english_text5 => "Head of Interactive"
              )


puts '>>> EMPTY THE MONGODB DATABASE'
#Mongoid.master.collections.reject { |c| c.name =~ /^system/}.each(&:drop)

puts '>>> SETTING UP DEFAULT ADMIN USER'
AdminUser.create!(:email                  => 'admin@techgroup.com',
                  :password               => 'admin@techgroup.com',
                  :password_confirmation  => 'admin@techgroup.com')

puts '>>> CREATE CATEGORIES'
Category.create!(:english_title => 'Search Engine Marketing',
                 :arabic_title  => '',
                 :slug          => 'search-engine-marketing')

Category.create!(:english_title => 'Media Buying',
                 :arabic_title  => '',
                 :slug          => 'media-buying')

Category.create!(:english_title => 'Best Practices',
                 :arabic_title  => '',
                 :slug          => 'best-practices')

Category.create!(:english_title => 'Social Currency',
                 :arabic_title  => '',
                 :slug          => 'social-currency')

Category.create!(:english_title => 'Webinar',
                 :arabic_title  => '',
                 :slug          => 'webinar')

Category.create!(:english_title => 'Crisis Communication',
                 :arabic_title  => '',
                 :slug          => 'crisis-communication')

Category.create!(:english_title => 'Miscellaneous',
                 :arabic_title  => '',
                 :slug          => 'miscellaneous')

Category.create!(:english_title => 'Marketing',
                 :arabic_title  => '',
                 :slug          => 'marketing')

Category.create!(:english_title => 'Digital Trends',
                 :arabic_title  => '',
                 :slug          => 'digital-trends')
