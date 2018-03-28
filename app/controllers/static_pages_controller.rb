class StaticPagesController < ApplicationController
  def welcome

  end

  def research

  end

  def teaching

  end

  def workshops

  end

  def services

  end

  def nonacademicstuff

  end

  def testarea
    @texts = Text.all
  end
end
