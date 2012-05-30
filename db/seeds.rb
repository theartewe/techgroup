# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

puts '>>> CREATE SLIDES'

Slide.create!(:english_text1 => "We Help All of Our MENA Clients Advertise on the Internet",
              :english_text2 => "<b>Experience</b>, <b>collaboration</b> and <b>advanced</b> tools makes Levant Digital the best in the Middle East.",
              :english_text3 => "Our goal is to provide our Mena and GCC customers with leading online marketing solutions that integrate all of your digital advertising needs.",
              :english_text4 => "Mr. Imad Jomaa",
              :english_text5 => "Chairman",
               :arabic_text1 => "",
               :arabic_text2 => "",
               :arabic_text3 => "",
               :arabic_text4 => "",
               :arabic_text5 => "")

Slide.create!(:english_text1 => "Levant Elevates Your Small Business to Create Results",
              :english_text2 => "Our marketing experts understand the ever changing landscape of online marketing and can help your business grow.",
              :english_text3 => "Small Business Solutions",
              :english_text4 => "<li>Flexible plans customized to your needs</li><li>Dedicated account manager</li><li>Daily Reporting and Optimization</li>",
              :english_text5 => "Get Started",
               :arabic_text1 => "",
               :arabic_text2 => "",
               :arabic_text3 => "",
               :arabic_text4 => "",
               :arabic_text5 => "")

Slide.create!(:english_text1 => "Strategic SEO Improves Organic Rankings And Traffic",
              :english_text2 => "Levant's partner, WPromote, optimized their newly designed website and preserved their organic rankings upon launch.",
              :english_text3 => "Their technical knowledge and commitment to service makes them an ideal partner!",
              :english_text4 => "Blake Mycoskie",
              :english_text5 => "Founder &amp; Chief Shoe Giver, TOMS",
               :arabic_text1 => "",
               :arabic_text2 => "",
               :arabic_text3 => "",
               :arabic_text4 => "",
               :arabic_text5 => "")

Slide.create!(:english_text1 => "First-Class Online Marketing With Results",
              :english_text2 => "Levant's parter, WPromote, developed a comprehensive marketing strategy for HP's expansive enterprise website to help capture additional sales leads.",
              :english_text3 => "A clear understanding of our enterprise site requirements was crucial to our site growth and ongoing optimization.",
              :english_text4 => "Charles McRoy",
              :english_text5 => "Marketing Director",
               :arabic_text1 => "",
               :arabic_text2 => "",
               :arabic_text3 => "",
               :arabic_text4 => "",
               :arabic_text5 => "")

Slide.create!(:english_text1 => "SEO Requires Real Creativity and Awareness",
              :english_text2 => "Levant's Partner, WPromote, helped transition the new Van's website to a more robust reporting platform to better understand consumer sentiment.",
              :english_text3 => "Using cutting edge reporting tools has greatly improved our understanding of what customers want.",
              :english_text4 => "Shawn Hunt",
              :english_text5 => "Head of Interactive",
               :arabic_text1 => "",
               :arabic_text2 => "",
               :arabic_text3 => "",
               :arabic_text4 => "",
               :arabic_text5 => "")


puts '>>> EMPTY THE MONGODB DATABASE'
Mongoid.master.collections.reject { |c| c.name =~ /^system/}.each(&:drop)

puts '>>> SETTING UP DEFAULT ADMIN USER'
AdminUser.create!(:email                  => 'admin@levantdigital.com',
                  :password               => 'admin@levantdigital.com',
                  :password_confirmation  => 'admin@levantdigital.com')

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

puts '>>> CREATE POSTS'
Post.create!(:language   => 'English',
             :slug       => 'our-customer-are-top-priority',
             :title      => 'Our Customers Are Top Priority',
             :categories => '["social-currency", "webinar", "search-engine-marketing", "best-practices", "social-currency"]',
             :excerpt    => '<p>In the past decade or so, online marketing has transitioned from placement at the outskirts of mainstream marketing tools to the up-front-and-center position for all businesses, regardless of size, industry or influence.</p> <div class="image"><img src="http://www.levantdigital.com/images/news-sample-image.jpg" alt="Image"></div> <p>In the past decade or so, online marketing has transitioned from placement at the outskirts of mainstream marketing tools to the up-front-and-center position for all businesses, regardless of size, industry or influence. As technology has evolved, we have expanded our services to include integrated PPC Management, Search Engine Optimization and Media Buying, as well as Social Media, Viral Marketing and website design.</p>',
             :body       => '',
             :published  => true,
             :date       => '2011-01-11')

puts '>>> SETTING UP PAGES'
Page.create!(:name                => "Home",
             :path                => "/",
             :english_title       => "Levant Digital",
             :english_description => "We Help All of Our MENA Clients Advertise on the Internet",
             :arabic_title        => "",
             :arabic_description  => "")

Page.create!(:name                => "About",
             :path                => "/about",
             :english_title       => "About",
             :english_description => "With years of experience in business and online marketing, Levant Digital brings excellent results to your doorstep",
             :arabic_title        => "",
             :arabic_description  => "")

Page.create!(:name                => "Contact",
             :path                => "/contact",
             :english_title       => "Contact",
             :english_description => "Contact the leading search engine marketing firm in the Middle East",
             :arabic_title        => "",
             :arabic_description  => "")

Page.create!(:name                => "Services",
             :path                => "/services",
             :english_title       => "Services",
             :english_description => "All digital marketing solutions for the Middle East: PPC, SEO, Media Buying",
             :arabic_title        => "",
             :arabic_description  => "")


Page.create!(:name                => "PPC Management",
             :path                => "/services/ppc-management",
             :english_title       => "PPC Management",
             :english_description => "Turn Clicks Into Customers With PPC Management",
             :arabic_title        => "",
             :arabic_description  => "")

Page.create!(:name                => "SEO Optimization",
             :path                => "/services/seo-optimization",
             :english_title       => "SEO Optimization",
             :english_description => "SEO Best Practices Will Help Your Organic Rankings",
             :arabic_title        => "",
             :arabic_description  => "")

Page.create!(:name                => "Social Media",
             :path                => "/services/social-media",
             :english_title       => "Social Media",
             :english_description => "It's Time To Seize the Power of Social Media Marketing",
             :arabic_title        => "",
             :arabic_description  => "")

Page.create!(:name                => "Conversion Optimization",
             :path                => "/services/conversion-optimization",
             :english_title       => "Conversion Optimization",
             :english_description => "The Power Of Testing, Come To Life",
             :arabic_title        => "",
             :arabic_description  => "")


Page.create!(:name                => "Media Buying",
             :path                => "/services/media-buying",
             :english_title       => "Media Buying",
             :english_description => "Sometimes You Get More Than What You Pay For",
             :arabic_title        => "",
             :arabic_description  => "")

Page.create!(:name                => "Crisis Communication",
             :path                => "/services/crisis-communication",
             :english_title       => "Crisis Communication",
             :english_description => "For every type of crisis situation there is an online solution",
             :arabic_title        => "",
             :arabic_description  => "")

Page.create!(:name                => "News",
             :path                => "/news",
             :english_title       => "News",
             :english_description => "With years of experience in business and online marketing, Levant Digital brings excellent results to your doorstep",
             :arabic_title        => "",
             :arabic_description  => "")


puts '>>> SETTING UP SECTIONS'
#
# HOME
#
puts '>>> HOME'
page = Page.first(conditions: {:path => "/"})

PageSection.create!(:page_id              => page.id,
                    :name                 => "01-text",
                    :english_title        => "Why Levant Digital Stands Out from the Rest",
                    :english_text         => "<p>For the best in PPC Management, Search Engine Optimization and Media Buying in the Middle East, there is no greater option than Levant Digital. We have years of experience with paid search, SEO and PPC Adwords campaigns, which we've paired with the expertise of Wpromote, the #1 ranked search engine marketing firm in the United States. Through this one-of-a-kind partnership, Levant Digital is able to offer the very best in SEO, PPC Management, Social Media and website design to all our clients in the Middle East.</p>",
                    :arabic_title         => "",
                    :arabic_text          => "")

PageSection.create!(:page_id              => page.id,
                    :name                 => "02-text",
                    :english_title        => "First-Class Online Marketing with Results",
                    :english_text         => "<p>Levant Digital offers first-class online marketing for every business, no matter how large or small. Due to our decades of experience in the business world, the added knowledge of Wpromote's expert team, and the use of highly advanced technology tools, Levant Digital knows the winning formula your company needs to strengthen its online presence and improve the bottom line. We always work closely with your business and learn the subtleties of each specific industry in order to collect the most useful data and deliver the best results.</p>",
                    :arabic_title         => "",
                    :arabic_text          => "")

PageSection.create!(:page_id              => page.id,
                    :name                 => "03-text",
                    :english_title        => "The Perfect Mix of Data and Technology",
                    :english_text         => "<p>For your PPC campaign, we are fully aware that computers and technology are not able to do everything for us. By adding real human knowledge and understanding to the mix of data and technology, we are able to create the perfect recipe for quality scores and click-through rates. Identifying the essential balance between all the options there are for research, strategy, data and marketing savvy are integral to the success of any PPC campaign - which is why human experience remains such an important element of the equation.</p>",
                    :arabic_title         => "",
                    :arabic_text          => "")

PageSection.create!(:page_id              => page.id,
                    :name                 => "04-text",
                    :english_title        => "SEO Requires Real Creativity and Awareness",
                    :english_text         => "<p>The same truths apply to SEO as well - Search Engine Optimization requires real creativity and awareness, and cannot simply be gained by paying for good results. In order to build your audience and clout within your industry, we employ cutting-edge tactics and rely on our comprehensive understanding of search engines and how they work. We also know that SEO results are hard to predict and even harder to make permanent, which is why we perform consistent data collection, analysis and reviews of campaign performance. By always doing this, we can deliver the boosted rankings, enhanced analytics, and long term growth that your company is seeking.</p>",
                    :arabic_title         => "",
                    :arabic_text          => "")

#
# ABOUT
#
puts '>>> ABOUT'
page = Page.first(conditions: {:path => "/about"})

PageSection.create!(:page_id              => page.id,
                    :name                 => "01-header",
                    :english_title        => "With years of experience in business and online marketing, Levant Digital brings excellent results to your doorstep",
                    :english_text         => "After much growth, we remain committed to helping businesses succeed in the digital marketing world",
                    :arabic_title         => "",
                    :arabic_text          => "")

PageSection.create!(:page_id              => page.id,
                    :name                 => "02-text",
                    :english_title        => "Levant is Committed to Helping Businesses Achieve Results",
                    :english_text         => "<p>In the past decade or so, online marketing has transitioned from placement at the outskirts of mainstream marketing tools to the up-front-and-center position for all businesses, regardless of size, industry or influence. As technology has evolved, we have expanded our services to include integrated PPC Management, Search Engine Optimization and Media Buying, as well as Social Media, Viral Marketing and website design. Our digital marketing campaigns produce phenomenal results, especially when working in tandem with one another. Although we have changed and grown since our inception, our commitment to helping businesses get the results they are seeking in the digital marketing world has not.</p><p>At Levant Digital, our commitment to helping businesses succeed and overcome market challenges has helped us become one of the world's top online marketing firms. From our headquarters in Beirut, we offer services that help global businesses maximize the success of their digital marketing campaigns and stay on the cutting-edge of evolving technology and marketing platforms. We believe that our success is your success, and we always shoot to produce results that go beyond your goals.</p>",
                    :arabic_title         => "",
                    :arabic_text          => "")

[["Unilever",   "images/client_logos-unilever.png"],
 ["Coca-Cola",  "images/client_logos-cocacola.png"],
 ["HSBC",       "images/client_logos-hsbc.png"],
 ["Pepsi",      "images/client_logos-pepsi.png"],
 ["Toyota",     "images/client_logos-toyota.png"],
 ["Zain",       "images/client_logos-zain.png"],
 ["Nokia",      "images/client_logos-nokia.png"],
 ["L'Oreal",    "images/client_logos-loreal.png"],
 ["Mars",       "images/client_logos-mars.png"],
 ["Samsung",    "images/client_logos-samsung.png"],
 ["LG",         "images/client_logos-lg.png"],
 ["P&G",    "images/client_logos-pg.png"]].each_with_index do |c, index|
  index = (index + 3).to_s
  index = "0" + index if index.size == 1
  PageSection.create!(:page_id              => page.id,
                      :name                 => "#{index}-client",
                      :english_title        => c[0],
                      :english_text         => "",
                      :arabic_title         => "",
                      :arabic_text          => "",
                      :default_image_url    => c[1])
end

PageSection.create!(:page_id              => page.id,
                    :name                 => "15-text",
                    :english_title        => "Comprehensive and Strategic Digital Marketing Plans",
                    :english_text         => "<p>For your PPC campaign, we are fully aware that computers and technology are not able to do everything for us. By adding real human knowledge and understanding to the mix of data and technology, we are able to create the perfect recipe for quality scores and click-through rates. Identifying the essential balance between all the options there are for research, strategy, data and marketing savvy are integral to the success of any PPC campaign-which is why human experience remains such an important element of the equation.</p>",
                    :arabic_title         => "",
                    :arabic_text          => "")


PageSection.create!(:page_id              => page.id,
                    :name                 => "16-button",
                    :english_title        => "View Out Services",
                    :english_text         => "Check out our marketing solutions to see what we can do for your company, and then request a consultation so we can show you what we do best.",
                    :arabic_title         => "",
                    :arabic_text          => "")

#
# CONTACT
#
puts '>>> CONTACT'
page = Page.first(conditions: {:path => "/contact"})

PageSection.create!(:page_id              => page.id,
                    :name                 => "01-header",
                    :english_title        => "Contact The Leading Search Engine Marketing Firm <br />in the Middle East",
                    :english_text         => "Discover the digital marketing options available for boosting your company's authority within the industry - contact us today",
                    :arabic_title         => "",
                    :arabic_text          => "")

PageSection.create!(:page_id              => page.id,
                    :name                 => "02-address",
                    :english_title        => "Levant Digital Inc",
                    :english_text         => '<li>Headquarters</li><li>Verdun Trade Center, Block B</li><li>3rd Floor</li><li>Beirut, Lebanon</li><li style="margin-top:10px;"><a href="mailto:info@levantdigital.com" title="Email Us">Info@LevantDigital.com</a></li><li>PH: +961 1 799973-4</li><li>Fax: +961 1 799975</li>',
                    :arabic_title         => "",
                    :arabic_text          => "")

PageSection.create!(:page_id              => page.id,
                    :name                 => "03-address-text",
                    :english_title        => "We are one of the world's top search engine marketing firms.",
                    :english_text         => "<p>At Levant Digital, we are committed to providing great online marketing campaigns and other services necessary for businesses to succeed and overcome market challenges. This dedication to customer service, combined with our many years of experience in marketing and business, has helped us become one of the world's top search engine marketing firms.</p><p>From our headquarters in Beirut, we are pleased to offer services that allow local and global businesses to maximize the success of their digital marketing campaigns and remain poised at the cutting-edge of developing technology and marketing platforms. We always aim to produce results that go beyond your goals, because we firmly believe that our success is equally your success.</p><p>We provide superior results to all our clients because we go further than other marketing agencies and get to know our clients' businesses and industries. This allows us to deliver superior customer service, as well as custom results that top your competitors. All our services are available under one roof with integrated campaign management, so our clients get the best out of their investment and benefit from different Search Engine Optimization, Search Engine Marketing, Pay Per Click Advertising, Social Media and Media Buying campaigns operating in tandem with one another.</p>",
                    :arabic_title         => "",
                    :arabic_text          => "")

PageSection.create!(:page_id              => page.id,
                    :name                 => "04-office",
                    :english_title        => "Levant Digital Office Locations",
                    :english_text         => "<li><strong>Beirut</strong>, Lebanon <small>Headquarters</small></li><li><strong>Los Angeles</strong>, California, United States</li><li><strong>Baghdad</strong>, Iraq</li><li><strong>Kabul</strong>, Afghanistan</li><li><strong>Dubai</strong>, United Arab Emirates</li><li><strong>Doha</strong>, Ad Dawhah, Qatar</li><li><strong>Riyadh</strong>, Ar Riyad, Saudi Arabia</li><li><strong>Rabat</strong>, Rabat-Sale-Zemmour-Zaer, Morocco</li><li><strong>Cairo</strong>, Al Qahirah, Egypt</li><li><strong>Amman</strong>, Jordan</li><li><strong>Muscat</strong>, Oman</li>",
                    :arabic_title         => "",
                    :arabic_text          => "")

PageSection.create!(:page_id              => page.id,
                    :name                 => "05-office-text",
                    :english_title        => "Offices Text",
                    :english_text         => "<h4>Although we are based in Lebanon, we have offices across the Middle East in order to serve you better.</h4><h4>Our partner company, Wpromote, is the #1 ranked search engine marketing firm in the United States.</h4><p>If you would like to learn more about how our digital marketing services can benefit your brand and drive revenue, contact us today for a consultation. We are happy to discuss the multitude of possibilities available for improving your company's online presence and delivering impressive results.</p>",
                    :arabic_title         => "",
                    :arabic_text          => "")

#
# SERVICES
#
puts '>>> SERVICES'
page = Page.first(conditions: {:path => "/services"})

PageSection.create!(:page_id              => page.id,
                    :name                 => "00-header",
                    :english_title        => "All Digital Marketing Solutions for the Middle East: <br />PPC, SEO, Media Buying",
                    :english_text         => "What can Levant Digital do for your online presence?",
                    :arabic_title         => "",
                    :arabic_text          => "",
                    :default_image_url    => "orange")

PageSection.create!(:page_id              => page.id,
                    :name                 => "01-text",
                    :english_title        => "A Perfect Balance of Human Expertise and Cutting-Edge Technology",
                    :english_text         => "<p>At Levant Digital, we know that numbers don't lie. That's why our team of PPC, SEO and Social Media experts works day in and day out to collect accurate and useful data that will improve the performance of your online marketing campaigns. Through PPC Management, Search Engine Optimization and Search Engine Marketing, we collaborate with businesses of all sizes to develop effective marketing campaigns that expand your online presence and improve your bottom line.</p><p>Whether you are fledgling business just getting off the ground or an industry-leading corporation, your digital marketing campaigns benefit from our firm belief that the best results come from a perfect balance of human expertise and cutting-edge technology. By embracing the best technology available and putting these powerful tools in the hands of our capable and experienced team members, we can give your company a greater chunk of market share and better performance than the competition.</p>",
                    :arabic_title         => "",
                    :arabic_text          => "")

PageSection.create!(:page_id              => page.id,
                    :name                 => "02-image",
                    :english_title        => "A Perfect Balance of Human Expertise and Cutting-Edge Technology",
                    :english_text         => "",
                    :arabic_title         => "",
                    :arabic_text          => "",
                    :default_image_url    => "images/services-overview-1.png")

PageSection.create!(:page_id              => page.id,
                    :name                 => "03-text",
                    :english_title        => "A Perfect Balance of Human Expertise and Cutting-Edge Technology",
                    :english_text         => "<p>To deliver the best PPC Management, Search Engine Optimization and Search Engine Marketing campaigns, we transform ourselves into an extension of your company-so we are not just working for you, but also with you. By learning and becoming extremely familiar with the ins and outs of your business and particular industry, we are able to extract data from performance reports that is relevant to your mission.</p><p>Our experienced account managers use the data collected by our comprehensive tools to manually optimize your campaign. Account managers are an integral part of every client's success and they serve as the most effective and efficient means for communication and collaboration. Collecting vast quantities of analytics information is time wasted unless it is all reviewed and interpreted in a meaningful way for your business. Our reviews of daily performance data allow us to constantly make adjustments, changes and improvements for the most optimized performance possible.</p>",
                    :arabic_title         => "",
                    :arabic_text          => "")

PageSection.create!(:page_id              => page.id,
                    :name                 => "04-image",
                    :english_title        => "We Transform Ourselves into an Extension of Your Company",
                    :english_text         => "",
                    :arabic_title         => "",
                    :arabic_text          => "",
                    :default_image_url    => "images/services-overview-2.png")

PageSection.create!(:page_id              => page.id,
                    :name                 => "05-text",
                    :english_title        => "#1 Full-Service Digital Marketing Agency in the Middle East & North Africa",
                    :english_text         => "<p>Levant Digital is the #1 full-service digital marketing agency in the Middle East and North Africa offering international clients a comprehensive range of digital marketing services that come with a level of service not found anywhere else.</p><p>We provide clients the best value and performance, all under one roof. Equipped with an in-house creative design department, comprehensive testing services and a large team of expert marketing professionals, we deliver impressive results, high-satisfaction ratings and unmatched client retention rates.</p><p>Learn more about our PPC Management services, organic Search Engine Optimization solutions and Search Engine Marketing campaigns. Or request a consultation today to see how we can change your online presence for the better.</p>",
                    :arabic_title         => "",
                    :arabic_text          => "")

PageSection.create!(:page_id              => page.id,
                    :name                 => "06-image",
                    :english_title        => "#1 Full-Service Digital Marketing Agency in the Middle East & North Africa",
                    :english_text         => "",
                    :arabic_title         => "",
                    :arabic_text          => "",
                    :default_image_url    => "images/services-overview-3.png")

#
# SERVICES: PPC Management
#
puts '>>> SERVICES: PPC Management'
page = Page.first(conditions: {:path => "/services/ppc-management"})

PageSection.create!(:page_id              => page.id,
                    :name                 => "00-header",
                    :english_title        => "Technology that outperforms the industry standard is just one of the many service advantages that set Levant apart from the competition.",
                    :english_text         => "What can Levant Digital do for your online presence?",
                    :arabic_title         => "",
                    :arabic_text          => "",
                    :default_image_url    => "red")

PageSection.create!(:page_id              => page.id,
                    :name                 => "01-text",
                    :english_title        => "What is our PPC Management?",
                    :english_text         => "<p>At Levant Digital, we make it our business to understand your business and develop a tailored Pay per Click marketing strategy that provides you with the best value and return on your investment. We combine expert knowledge of Microsoft and Google search platforms with powerful proprietary technology and professional analysts who understand what it takes to run a successful PPC campaign. With experience in hundreds of industries, we bring the knowledge and expertise needed to create effective marketing strategies that will give your business a competitive edge in any market.</p><h5>Our range of PPC Management services includes:</h5><ul><li>Research and analysis of your industry and competitors</li><li>Ad copy creation, testing and implementation</li><li>24/7 campaign tracking</li><li>Custom reporting tools and analytics</li><li>Access to conversion numbers and campaign ROI</li><li>Complete sale and lead tracking, including phone conversions</li><li>Extensive keyword research and testing</li><li>Click-fraud tracking and reporting keeps your advertising costs low</li><li>Trademark and copyright infringement monitoring</li><li>Consulting services and custom reports prepared by expert analysts</li><li>Geo-targeted campaigns and day-parting to identify your consumers and prime time markets</li></ul>",
                    :arabic_title         => "",
                    :arabic_text          => "")

PageSection.create!(:page_id              => page.id,
                    :name                 => "02-image",
                    :english_title        => "What is our PPC Management?",
                    :english_text         => "",
                    :arabic_title         => "",
                    :arabic_text          => "",
                    :default_image_url    => "images/services-ppcmanagement-1.png")

PageSection.create!(:page_id              => page.id,
                    :name                 => "03-text",
                    :english_title        => "Our Tools - Technology",
                    :english_text         => "<p>We go far beyond bid management and keyword selection by offering market research, testing services and effective strategies that result in highly successful campaigns with more leads at a lower cost per conversion.</p><p>Although we love technology and algorithms, it's our team of talented experts that makes our digital marketing campaigns so successful. To make the most of our advanced technology and achieve the best results for our clients in the Middle East and North Africa, we use a team of digital marketing experts backed by years of industry experience.</p><p>Our advanced technology allows us to track your entire campaign, including impressions, clicks, conversions, sales and phone leads. Keyword bid management and audience segmenting tools give us the power to deliver highly targeted ads for a higher conversion ratio. Our proprietary PPC technology allows clients and analysts to monitor real-time campaign progress. Using advanced data and metrics, we can make instant changes to adapt your campaign to current market conditions and capitalize on trends. By offering the best return on your marketing investment, our clients keep coming back year after year.</p>",
                    :arabic_title         => "",
                    :arabic_text          => "")

PageSection.create!(:page_id              => page.id,
                    :name                 => "04-image",
                    :english_title        => "Our Tools - Technology",
                    :english_text         => "",
                    :arabic_title         => "",
                    :arabic_text          => "",
                    :default_image_url    => "images/services-ppcmanagement-2.png")

PageSection.create!(:page_id              => page.id,
                    :name                 => "05-text",
                    :english_title        => "Our Approach to PPC",
                    :english_text         => "<p>Over the past decade, Pay per Click advertising has grown enormously and so has the competition. To give you a competitive edge in a competitive market, we combine cutting-edge technology with ongoing campaign management services.</p><p>Running campaigns with a set it and forget it mentality is a dangerous proposition and an easy way to get left behind or lose valuable marketing cash. Our constant campaign monitoring services adjust strategies to current market conditions. In a world where advertising costs, buyer habits and seasonal trends are always in play, we adapt your PPC campaign to deliver the best results for your marketing dollar.</p><p>We have taken the old marketing triad of identifying, locating and connecting with the customer and adapted it to the digital advertising platform where we can target audiences by age, gender and location to deliver selective marketing solutions that each customer will identify with.</p>",
                    :arabic_title         => "",
                    :arabic_text          => "")

PageSection.create!(:page_id              => page.id,
                    :name                 => "06-image",
                    :english_title        => "Our Approach to PPC",
                    :english_text         => "",
                    :arabic_title         => "",
                    :arabic_text          => "",
                    :default_image_url    => "images/services-ppcmanagement-3.png")

#
# SERVICES: SEO Optimization
#
puts '>>> SERVICES: SEO Optimization'
page = Page.first(conditions: {:path => "/services/seo-optimization"})

PageSection.create!(:page_id              => page.id,
                    :name                 => "00-header",
                    :english_title        => "We analyze the details to create the best user experience by monitoring user navigation, tailoring content and outpacing the competition.",
                    :english_text         => "What can Levant Digital do for your online presence?",
                    :arabic_title         => "",
                    :arabic_text          => "",
                    :default_image_url    => "red")

PageSection.create!(:page_id              => page.id,
                    :name                 => "01-text",
                    :english_title        => "Is SEO the Viable Answer?",
                    :english_text         => "<p>Search engine optimization is a hotly debated topic that is often associated with secrecy and advanced technology that is prone to being misused by those who believe they can buy their way to success. When used correctly, SEO tools are invaluable solutions that can create new opportunities for your business. Our SEO services provide short-term and long-term results to improve your search engine ranking today and build your business tomorrow.</p><p>Our extensive SEO campaigns are designed to build your client base, brand loyalty and industry presence through effective website design, digital publicity, programming, web content and much more.</p><h5>Organic search engine optimization solutions include:</h5><ul><li>Webmaster tools and analytic systems</li><li>Effective keyword placement and analysis</li><li>Implementation of correct domains and redirects</li><li>Custom 404 error pages to direct traffic to the right location</li><li>SEO-friendly titles and Meta descriptions</li><li>Assistance with site architecture and programming</li><li>Internal and external link building</li><li>HTML and XML sitemaps</li><li>Infographic creation and implementation</li><li>Monthly reports with initial rankings and improvements</li><li>Social bookmarking</li><li>Digital PR and publicity</li><li>Directory and search engine submission</li></ul>",
                    :arabic_title         => "",
                    :arabic_text          => "")

PageSection.create!(:page_id              => page.id,
                    :name                 => "02-image",
                    :english_title        => "Is SEO the Viable Answer?",
                    :english_text         => "",
                    :arabic_title         => "",
                    :arabic_text          => "",
                    :default_image_url    => "images/services-seooptimization-1.png")

PageSection.create!(:page_id              => page.id,
                    :name                 => "03-text",
                    :english_title        => "Our Tools - Infographics",
                    :english_text         => "<p>We go far beyond bid management and keyword selection by offering market research, testing services and effective strategies that result in highly successful campaigns with more leads at a lower cost per conversion.</p><p>Although we love technology and algorithms, it's our team of talented experts that makes our digital marketing campaigns so successful. To make the most of our advanced technology and achieve the best results for our clients in the Middle East and North Africa, we use a team of digital marketing experts backed by years of industry experience.</p><p>Our advanced technology allows us to track your entire campaign, including impressions, clicks, conversions, sales and phone leads. Keyword bid management and audience segmenting tools give us the power to deliver highly targeted ads for a higher conversion ratio. Our proprietary PPC technology allows clients and analysts to monitor real-time campaign progress. Using advanced data and metrics, we can make instant changes to adapt your campaign to current market conditions and capitalize on trends. By offering the best return on your marketing investment, our clients keep coming back year after year.</p>",
                    :arabic_title         => "",
                    :arabic_text          => "")

PageSection.create!(:page_id              => page.id,
                    :name                 => "04-image",
                    :english_title        => "Our Tools - Infographics",
                    :english_text         => "",
                    :arabic_title         => "",
                    :arabic_text          => "",
                    :default_image_url    => "images/services-seooptimization-2.png")

PageSection.create!(:page_id              => page.id,
                    :name                 => "05-text",
                    :english_title        => "Our Approach to SEO",
                    :english_text         => "<p>We use a holistic approach to improve all aspects of your online presence and create an SEO-friendly package with the power to open doors for your business on and offline.</p><p>Our simple and effective approach combines powerful technology and proven strategies to improve the ranking of your website and give you a competitive advantage. Each SEO campaign begins with a complete analysis of your industry, products, services and competitors. To provide your business with the best SEO solutions, we need to know what sets your company apart from the competition. Once we understand your business, we can create an SEO plan to target your customers based on when, where and how they use online search tools.</p><p>We analyze all the details to create the best user experience and SEO solutions. By monitoring how users navigate your website, we can tailor the content and help your company outpace the competition.</p>",
                    :arabic_title         => "",
                    :arabic_text          => "")

PageSection.create!(:page_id              => page.id,
                    :name                 => "06-image",
                    :english_title        => "Our Approach to SEO",
                    :english_text         => "",
                    :arabic_title         => "",
                    :arabic_text          => "",
                    :default_image_url    => "images/services-seooptimization-3.png")

#
# SERVICES: Social Media
#
puts '>>> SERVICES: Social Media'
page = Page.first(conditions: {:path => "/services/social-media"})

PageSection.create!(:page_id              => page.id,
                    :name                 => "00-header",
                    :english_title        => "Tailored social media solutions consist of detailed strategy of campaign goals, campaign type and platforms to provide the best results.",
                    :english_text         => "What can Levant Digital do for your online presence?",
                    :arabic_title         => "",
                    :arabic_text          => "",
                    :default_image_url    => "red")

PageSection.create!(:page_id              => page.id,
                    :name                 => "01-text",
                    :english_title        => "Is Social Media the Future?",
                    :english_text         => "<p>With millions of consumers connected through social media outlets, finding your key demographic is the hardest part. At Levant Digital, we offer a full range of social media services to help your business connect with key consumers, improve revenue and tap into new markets.</p><p>Viral marketing campaigns and advertising through social media outlets is an effective way to grow your brand and consumer base. The potential for growth by connecting with new consumers on social medial platforms is virtually unlimited. We offer a complete range of campaign management solutions to help your business capitalize on the untapped markets at Facebook, MySpace, LinkedIn, Twitter, YouTube, Digg, StumbleUpon and other popular Web properties.</p><p>Our expert team is ready to identify business goals and help you reach them through cost-effective social media campaigns. Once your social media campaign is up and running, we continue to monitor and optimize performance for current market conditions. With the growth of social media platforms reaching break-neck speed, our experienced team is here to help your business take advantage of this powerful advertising and marketing tool without getting in over your head or getting lost in a sea of online profiles.</p><p>Our extensive SEO campaigns are designed to build your client base, brand loyalty and industry presence through effective website design, digital publicity, programming, web content and much more.</p>",
                    :arabic_title         => "",
                    :arabic_text          => "")

PageSection.create!(:page_id              => page.id,
                    :name                 => "02-image",
                    :english_title        => "Is Social Media the Future?",
                    :english_text         => "",
                    :arabic_title         => "",
                    :arabic_text          => "",
                    :default_image_url    => "images/services-socialmedia-1.png")

PageSection.create!(:page_id              => page.id,
                    :name                 => "03-text",
                    :english_title        => "Our Tools - Viral Marketing",
                    :english_text         => "<p>Viral marketing campaigns are a fun and effective way to connect with your primary audience and have your best consumers spread an important message or idea for you. Engaging your audience with entertaining content in the form of a video, widget, game or Web promotion is tremendously appealing to businesses and consumers. By sharing and interacting with your customer base, viral marketing campaigns build positive brand recognition, which translates to sales. The idea of sharing with consumers instead of offering a sales pitch has worked extremely well with younger demographics that quickly and effectively distribute content for maximum impact.</p><p>We are one of the only viral marketing specialists serving the Middle East and North Africa with the capabilities to create and promote your viral video or social marketing campaign. We don't wait for content to become viral - we make it happen with effective social media strategies.</p><h5>Our extensive viral marketing services include:</h5><ul><li>Concept development</li><li>Video production services</li><li>Content seeding and engagement</li><li>Multi-platform advertising campaigns</li><li>Blog posts and microsite development</li><li>Promotions and contests</li></ul>",
                    :arabic_title         => "",
                    :arabic_text          => "")

PageSection.create!(:page_id              => page.id,
                    :name                 => "04-image",
                    :english_title        => "Our Tools - Viral Marketing",
                    :english_text         => "",
                    :arabic_title         => "",
                    :arabic_text          => "",
                    :default_image_url    => "images/services-socialmedia-2.png")

PageSection.create!(:page_id              => page.id,
                    :name                 => "05-text",
                    :english_title        => "Our Social Process",
                    :english_text         => "<p> social media campaign can enhance the functionality of your high-performing SEO or PPC advertising campaign. Our tailored social media solutions start with a detailed assessment to determine your campaign goals and decide what platforms and what type of campaign can provide the best results.</p><p>All social media campaigns at Levant Digital start by helping businesses identify and connect with their ideal audience. Once key demographics and target audiences have been established, we can create a highly effective social media strategy.</p><p>We help companies reach their target customers, generate buzz, increase sales and grow their businesses with contextual advertising and integrated community engagement tools across social media platforms.</p><h5>Our social media services include:</h5><ul><li>Profile creation and optimization on all platforms</li><li>Targeted ad campaigns across social networks</li><li>Viral marketing campaigns, including video production, seeding and engagement</li><li>Online contests and promotions</li><li>Brand-reputation management</li><li>Social media conversation monitoring and more</li></ul>",
                    :arabic_title         => "",
                    :arabic_text          => "")

PageSection.create!(:page_id              => page.id,
                    :name                 => "06-image",
                    :english_title        => "Our Social Process",
                    :english_text         => "",
                    :arabic_title         => "",
                    :arabic_text          => "",
                    :default_image_url    => "images/services-socialmedia-3.png")

#
# SERVICES: Conversion Optimization
#
puts '>>> SERVICES: Conversion Optimization'
page = Page.first(conditions: {:path => "/services/conversion-optimization"})

PageSection.create!(:page_id              => page.id,
                    :name                 => "00-header",
                    :english_title        => "We efficiently test graphics, navigational buttons, ad content and calls to action to develop content with an optimal conversion rate.",
                    :english_text         => "What can Levant Digital do for your online presence?",
                    :arabic_title         => "",
                    :arabic_text          => "",
                    :default_image_url    => "red")

PageSection.create!(:page_id              => page.id,
                    :name                 => "01-text",
                    :english_title        => "How To Increase Conversions?",
                    :english_text         => "<p>Conversion optimization tools and multivariate testing allow us to compare an unlimited number of variables, so clients can rest assured we will leave no stone unturned. We test thousands of possible variations simultaneously to develop the best content possible for better conversion rates and a better return on investment.</h5><p>We offer pre-launch testing as well as ongoing conversion optimization to consistently give you the best results. By continuously optimizing conversion rates, we help businesses stay ahead of the competition and adapt to changing market conditions.</p><p>At Levant Digital, we combine advanced data analysis tools and expert strategists in a winning package. Our proprietary algorithms and advanced tools allow us to test an unlimited number of options with split tests and multivariate tests to determine if option A is better than option B. However, our expert analysts can also suggest choices C and D for maximum optimization.</p><p>With the technology to test an unlimited number of variables and multiple versions of content and ability to express the complex results in a concise report, we offer clients the best of both worlds. We efficiently test graphics, navigational buttons, ad content and calls to action to develop content with an optimal conversion rate.</p><p>Our inclusive conversion optimization services address all aspects of your marketing campaign, including content creation, design and customer reception, to achieve the best possible results for your money.</p>",
                    :arabic_title         => "",
                    :arabic_text          => "")

PageSection.create!(:page_id              => page.id,
                    :name                 => "02-image",
                    :english_title        => "Is Social Media the Future?",
                    :english_text         => "",
                    :arabic_title         => "",
                    :arabic_text          => "",
                    :default_image_url    => "images/services-conversionoptimization-1.png")

PageSection.create!(:page_id              => page.id,
                    :name                 => "03-text",
                    :english_title        => "Our Tools - Testing &amp; Reporting",
                    :english_text         => "<p>We thoroughly analyze your industry to determine the best course of action for improving conversion rates. Our expert strategists are trained to pin-point specific geographic regions and marketing elements to promote your business and achieve your goals. With conversion optimization campaigns, we look at all the options and narrow them down with sophisticated testing and reporting tools. Here are a few ways we optimize conversion rates:</p><h5>A/B Split Testing</h5><p>With A/B split testing, we put multiple versions of Web content in head-to-head match-ups to determine the winner. We can test new webpage designs, layouts and content against existing versions to see what works best. Our split testing system lets us plug in an infinite number of versions to compare options C and D as well.</p><h5>Multivariate Testing</h5><p>The second phase of conversion optimization uses simultaneous multivariate testing to compare multiple elements within a webpage or ad, so we can create winning combinations that result in higher conversion rates. We test and compare:</p><ul><li>Headlines</li><li>Graphics</li><li>Background</li><li>Button styles</li><li>Font size and color</li><li>Navigational elements</li><li>Call to action wording</li><li>Incentives and special offers</li><li>Guarantees and product statements</li><li>Customer testimonials</li><li>Industry awards</li></ul><h5>Reporting</h5><p>Our strategists deliver personalized weekly reports detailing overall campaign progress. With our easy to understand conversion optimization reports, we aim to give clients a clear look at the results of our testing, so our customers can understand which content worked and why.</p>",
                    :arabic_title         => "",
                    :arabic_text          => "")

PageSection.create!(:page_id              => page.id,
                    :name                 => "04-image",
                    :english_title        => "Our Tools - Viral Marketing",
                    :english_text         => "",
                    :arabic_title         => "",
                    :arabic_text          => "",
                    :default_image_url    => "images/services-conversionoptimization-2.png")

#
# SERVICES: Media Buying
#
puts '>>> SERVICES: Media Buying'
page = Page.first(conditions: {:path => "/services/media-buying"})

PageSection.create!(:page_id              => page.id,
                    :name                 => "00-header",
                    :english_title        => "Establish your campaign goals then determine most effective strategy via brand awareness, lead generation and direct response content.",
                    :english_text         => "What can Levant Digital do for your online presence?",
                    :arabic_title         => "",
                    :arabic_text          => "",
                    :default_image_url    => "red")

PageSection.create!(:page_id              => page.id,
                    :name                 => "01-text",
                    :english_title        => "Where's the Demographic?",
                    :english_text         => "<p>At Levant Digital, we have adapted the media buying process to deliver the best results for our clients. Over the years, we have seen banner ads, flash videos and interactive rich media content based on stale offline campaigns fail. We know what works and what doesn't to deliver the best service to our clients with a new level of accountability and reports that put you in touch with all aspects of your campaign, including spending and ROI.</p><p>We put our digital marketing and Web expertise to work for you, so your media buying campaign reaches your target customers every time. Our proprietary technology analyzes campaigns across platforms, so we can provide clients with the whole picture and a better value in the end.</p><p>Our media buying approach is simple. We start by establishing your campaign goals and work from there to determine the most effective strategy. Our media campaigns focus on brand awareness, lead generation and direct response content, whichever suits your business. Advancing marketing tools, including behavioral retargeting, contextual advertising and ad testing, give us the power to maximize conversion ratios.</p><p>To simplify the media buying process, we cover all aspects of campaign creation, implementation and optimization. Our integrated approach begins with significant research, testing and pre-launch preparations to ensure your campaign reaches its potential from day one. We cover media planning, site selection and negotiations to provide our clients with the best value.</p>",
                    :arabic_title         => "",
                    :arabic_text          => "")

PageSection.create!(:page_id              => page.id,
                    :name                 => "02-image",
                    :english_title        => "Where's the Demographic?",
                    :english_text         => "",
                    :arabic_title         => "",
                    :arabic_text          => "",
                    :default_image_url    => "images/services-mediabuying-1.png")

PageSection.create!(:page_id              => page.id,
                    :name                 => "03-text",
                    :english_title        => "Media Buying - Process",
                    :english_text         => "<p>Our goal is gaining a better understanding of your business, so we can create a campaign that fits. We identify your key consumer groups, analyze their habits and create solutions to connect with your audience.</p><h5>Media Planning</h5><p>We're with you every step of the way to build a campaign, assist with site selection and optimize the results. Our advanced capabilities allow us to maximize conversion rates and leads with retargeting, day-parting, and other tools.</p><h5>Content and Design</h5><p>To create a fresh campaign that maximizes click-through rates, we have a full-scale creative design department who can come up with cutting-edge concepts and ad content to maximize your results and ROI. After extensive comparisons and pre-launch tests, we are ready to unleash the power of your online marketing campaign.</p><h5>Media Buying Negotiations</h5><p>Our connections throughout the digital media world give us the ability to negotiate aggressively and secure highly-competitive rates with many partners, and the savings are passed on to you.</p><h5>Campaign Optimization</h5><p>We constantly track and adjust digital marketing campaigns to maximize clicks and conversions while minimizing spending. We focus on improving all aspects of your campaign from ad placement and campaign concept to creative content and ROI.</p><h5>Custom Reporting</h5><p>Our simple reporting system shows campaign spending, optimization changes, conversion rates, phone leads and much more, plus we send reports on your schedule with the information you want to see.</p><p>To discover how our media buying services can change the future of your online presence, register for a consultation today.</p>",
                    :arabic_title         => "",
                    :arabic_text          => "")

PageSection.create!(:page_id              => page.id,
                    :name                 => "04-image",
                    :english_title        => "Media Buying - Process",
                    :english_text         => "",
                    :arabic_title         => "",
                    :arabic_text          => "",
                    :default_image_url    => "images/services-mediabuying-2.png")

#
# SERVICES: Crisis Communication
#
puts '>>> SERVICES: Crisis Communication'
page = Page.first(conditions: {:path => "/services/crisis-communication"})

PageSection.create!(:page_id              => page.id,
                    :name                 => "00-header",
                    :english_title        => "Our crisis communication department extinguishes fires - digitally.",
                    :english_text         => "What can Levant Digital do for your online presence?",
                    :arabic_title         => "",
                    :arabic_text          => "",
                    :default_image_url    => "red")

PageSection.create!(:page_id              => page.id,
                    :name                 => "01-text",
                    :english_title        => "What is Crisis Communication?",
                    :english_text         => "<p>The old expression \"good news travels fast but bad news travels faster\" is more true today than ever before. Understanding how to deal with a crisis in the digital era is more important than ever. Whether you're a government, a multi-national corporation, a celebrity, or an entrepreneur, the need to deal with any crisis immediately has become essential.</p><p>At Levant Digital, we serve our MENA and GCC clients by harnessing the speed of the internet to create coordinated and integrated responses to any crisis. We understand how to craft the right answer to any problem and come out in front of any situation. Our integrated crisis communication approach incorporates all of our digital services into a customized solution for each client. The result is a digital public relations capability that helps our clients \"own their message\" through the power and speed of the internet.</p>",
                    :arabic_title         => "",
                    :arabic_text          => "")

PageSection.create!(:page_id              => page.id,
                    :name                 => "02-image",
                    :english_title        => "Where's the Demographic?",
                    :english_text         => "",
                    :arabic_title         => "",
                    :arabic_text          => "",
                    :default_image_url    => "images/services-crisiscommunication-1.png")

#
# NEWS
#
puts '>>> NEWS'
page = Page.first(conditions: {:path => "/news"})

PageSection.create!(:page_id              => page.id,
                    :name                 => "01-header",
                    :english_title        => "With years of experience in business and online marketing, <br/>Levant Digital brings excellent results to your doorstep",
                    :english_text         => "After much growth, we remain committed to helping businesses succeed in the digital marketing world",
                    :arabic_title         => "",
                    :arabic_text          => "")

