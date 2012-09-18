class BlogController < ApplicationController
  
  def index
    @posts = Page.for_blog.published.order('published_at desc').paginate(:page => params[:page], :per_page => 20)
    # respond_to  
    render :layout => 'blog'
  end
  
  def update_data
    
    @count = 0
    @pages = Array.new
    
    Page.all.each do |page|
      # determine whether page contains path
      if page.body.match /src="\/system\/photos\/.*\.jpg/
        # extract string to be changed
        # match_data = page.body.match /src="\/system\/photos\/.*\.jpg/
        # # extract an image name with jpg extension in the blog/2006 section
        # extracted_image = match_data.to_s.sub("src=\"/images/photos/", '')
        # # find the corresponding illustration
        # illustration = Illustration.find_by_name(extracted_image)
        # if illustration
        #   # change the image path
        #   page.body = page.body.sub("/images/blog/2007/", "/system/images/illustration/#{illustration.id}/large_")
        #   # save the page with new path
        #   page.save
        # end  
        @count += 1
        @pages << page
        
      end
    end
    
    # @list_of_files = Array.new
    
    # @count = 0
    
    # Illustration.all.each do |illustration|
    #   
    #   if illustration.name == 'No name given'
    #     
    #     illustration.destroy
    #     @count += 1 
    #     
    #   end
    #   
    #   # # extract an image name with jpg extension in the blog/2006 section
    #   # extracted_image = page.body.match(/src="\/images\/blog\/2006\/.*\.jpg/).to_s.sub("src=\"/images/blog/2006/", '')
    #   # 
    #   # if extracted_image
    #   #   
    #   #    # find the corresponding illustration
    #   #     @illustration = Illustration.find_by_image(File.basename("/Users/swamiatma/Documents/railsapps/aya/public/images/blog/2006/#{extracted_image}"))
    #   #     
    #   #     if @illustration
    #   #       # change the path of the image
    #   #       page.body = page.body.sub("/images/blog/2006/", "/system/images/illustration/#{@illustration.id}/large_")
    #   #       # save the page with new path
    #   #       page.save
    #   #     
    #   #       count += 1
    #   #       extracted_image = nil
    #   #     end
    #   #   
    #   # end
    #  
    # end
    
    # # take a blog post as an example
    # @page = Page.find(9)

    
    # redirect_to blog_path, notice: "#{count} wp images have been detected"
    # 
    # count = 0
    #     
    # Dir["/Users/swamiatma/Documents/railsapps/aya/public/images/photos/*.*"].each do |file|
    #   
    #   illustration = Illustration.new
    #   illustration.image = File.open(file)
    #   illustration.name = "photos-#{File.basename(file)}"
    #   illustration.save
    #   
    #   count += 1
    #   
    # end
    # 
    # 
    # redirect_to illustrations_path, notice: "#{count} new illustrations should be uploaded"
    
    
  end
  
end
