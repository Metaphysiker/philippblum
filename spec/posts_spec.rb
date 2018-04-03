require "rails_helper"

RSpec.describe Post, :type => :model do
  context "basic post creation" do
    it "single post" do
      post = Post.create(title: "random post")
      expect(post.title).to eq("random post")
    end

    it "second post with already taken name" do
      post = Post.create(title: "random post")
      post2 = Post.create(title: "random post")
      expect(post2.valid?).to be false
    end
  end
end