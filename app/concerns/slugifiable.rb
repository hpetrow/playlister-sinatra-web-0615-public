module Slugifiable

  module InstanceMethods

    def slug
      self.name.downcase.gsub(" ", "-")
    end

  end

  module ClassMethods

    def find_by_slug(slug_name)
      unslugged_name = slug_name.gsub("-", " ")
      self.all.find{|s| s.name.downcase == unslugged_name}
    end

  end
end
