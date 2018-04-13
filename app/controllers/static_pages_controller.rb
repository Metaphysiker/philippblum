class StaticPagesController < ApplicationController
  before_action :ahoytrack

  def welcome

    @post = Post.find_by_section("welcome")
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

  def testarea
    @texts = Text.all
  end

  private

  def ahoytrack
    ahoy.track action_name.to_s, {language: "Ruby"}
  end
end
