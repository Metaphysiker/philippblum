class StaticPagesController < ApplicationController
  before_action :user_allowed?, only: :visits

  def welcome
    @post = Post.find_by_section("welcome")
  end

  def aboutme
    @post = Post.find_by_section("aboutme")
  end

  def research
    @post = Post.find_by_section("research")
  end

  def teaching
    @post = Post.find_by_section("teaching")
  end

  def workshops
    @post = Post.find_by_section("workshops")
  end

  def services
    @post = Post.find_by_section("services")
  end

  def nonacademicstuff
    @post = Post.find_by_section("nonacademicstuff")
  end

  def talks
    @post = Post.find_by_section("talks")
  end

  def testarea
    @texts = Text.all
  end

  def visits
  @pagehash = {}

    StaticPagesController.action_methods.each do |c|
      @pagehash[c.to_s] = Ahoy::Event.select(:visit_id).distinct.where_props(action: c.to_s).count
    end


  end

  private

  def ahoytrack
    ahoy.track action_name.to_s, {language: "Ruby"}
  end
end
