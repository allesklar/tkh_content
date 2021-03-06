class Page < ActiveRecord::Base

  belongs_to :author, class_name: 'User'
  has_many :comments, as: :commentable, :dependent => :destroy

  has_many :taggings, :dependent => :destroy
  has_many :tags, through: :taggings

  tkh_searchable
  def self.tkh_search_indexable_fields
    indexable_fields = {
      title: 8,
      description: 3,
      body: 2
    }
  end

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :body
  validates_presence_of :author_id

  translates :title, :short_title, :description, :body

  # in tkh_illustrations gem
  mount_uploader :image, ImageUploader

  def to_param
    title ? "#{id}-#{title.to_url}" : id
  end

  scope :by_recent, -> { order('updated_at desc') }
  scope :for_blog, -> { where('for_blog = ?', true) }
  scope :not_for_blog, -> { where('for_blog = ?', false) }
  scope :published, -> { where('published_at IS NOT ?', nil) }
  scope :drafts, -> { where('published_at IS ?', nil) }
  scope :by_recently_published, -> { order('published_at desc') }
  # tree scopes
  scope :orphans, -> { where('parent_id IS ?', nil) }
  scope :with_parent_id, lambda { |id| where('parent_id = ?', id) }
  scope :by_title, -> { order('title') }
  scope :by_menu_position, -> { order('menu_position') }

  def nickname
    @nickname ||= short_title || title
  end

  def published?
    published_at.present? ? true : false
  end

  ### menu related instance methods

  def orphan?
    parent_id == nil
  end

  def has_children?
    Page.with_parent_id(id).published.count >= 1
  end

  def children
    Page.published.with_parent_id(id)
  end

  def parent
    Page.find(parent_id)
  end

  def has_siblings?
    Page.with_parent_id(parent_id).published.count >= 1
  end

  def siblings
    Page.published.with_parent_id(parent_id)
  end

  ### tagging related methods

  def self.tagged_with(name)
    Tag.find_by_name!(name).pages
  end

  def self.tag_counts
    Tag.select("tags.*, count(taggings.tag_id) as count").
      joins(:taggings).group("taggings.tag_id")
  end

  def tag_list
    tags.map(&:name).join(" ")
  end

  def tag_list=(names)
    self.tags = names.split(" ").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

  ### autocomplete related instance methods
  def parent_page_title
      parent.try(:title) unless self.orphan?
    end
  def parent_page_title=(title)
    if title.present? && Page.where(title: title)
      self.parent_id = Page.where(title: title).first.id
    else
      self.parent_id = nil
    end
  end

  def author_name
    author.try(:formal_name)
  end
  def author_name=(formal_name)
    name_as_array = formal_name.split(',')
    last_name = name_as_array[0].strip
    first_name = name_as_array[1].strip
    self.author_id = User.where("last_name = ? AND first_name = ?", last_name, first_name).first.id
  end

end
