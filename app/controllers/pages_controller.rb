require "ostruct"
class PagesController < ApplicationController
  allow_unauthenticated_access only: %i[ index features pricing subscriptions stats privacy terms_of_service refunds new dmca mobile ]
  before_action :resume_session

  def new
  end

  def mobile
  end

  def index
  end

  def features
  end

  def pricing
  end

  def subscriptions
  end

  def stats
  end

  def dmca
  end

  def privacy
  end

  def refunds
  end

  def terms_of_service
  end

  def reviews
    @reviews = [
      OpenStruct.new(
        title: "zero problems. so easy to use.",
        description: "Buzzsprout is straight forward and easy to use. My favorite feature is that it's super simple to go back and make corrections, even after you've published an episode. I literally have no complaints.",
        author: "Nicki Summy, Wits' End Church"
      ),
      OpenStruct.new(
        title: "Wonderful and easy podcast experience",
        description: "Buzzsprout is a very easy and user friendly tool that helps you publish your podcasts and host them at the same time.",
        author: "Gabriel Salgado, The Apps Tailors"
      ),
      OpenStruct.new(
        title: "So happy to find Buzzsprout!",
        description: "After having struggled with Podcasting for several months, Buzzsprout has been our answer! The software is very easy to use, it has nice enough features that look professional to our listeners. The price point is more than worth the money! A+!!!!",
        author: "Stacie Sampson, Zion Word Church"
      ),
      OpenStruct.new(
        title: "Love Buzzsprout!",
        description: "When I was first looking for a podcast hosting service, I attended Podcast Movement and met the people at Buzzsprout. They were very helpful, and their services and prices met my needs. I especially like their feature of transferring existing podcasts to their service. The stats are also very easy to use, and uploading an episode is super easy and fast. Wonderful service!",
        author: "Dax Stokes, The Vampire Historian Podcast"
      ),
      OpenStruct.new(
        title: "I did not think Podcasting would be this EASY",
        description: "This was my first foray into Podcasting and I did not know what to do or how to do it. I am so glad that I found Buzzsprout. I can easily upload my podcast the moment I finish recording. I can also easily view my statistics and reviews as well. This is a fantastic service, if you don't want to get bogged down by tech jargon and just want to easily get your podcast out, this is the service.",
        author: "Mike Reynolds, My Pursuit Podcast"
      ),
      OpenStruct.new(
        title: "Makes a first time podcaster look like a pro",
        description: "I was surprised how easy Buzzsprout made podcasting. I had never none anything like this before and in a short time I was looking like a pro online.",
        author: "Randy Hounsell, New Life Community Church"
      ),
      OpenStruct.new(
        title: "So Great Socks Knocked Off",
        description: "I have had a wonderful experience with Buzzsprout. The one time I had a concern about the process, I sent a message to support and received a response within hours, that was very impressive.",
        author: "Cece Denno, Sincerely Yours Podcast"
      ),
      OpenStruct.new(
        title: "Highly recommend Buzzsprout",
        description: "I've been using Buzzsprout for 5 years now and absolutely love the ease of use, and the continual updates to enhance the user experience. I've recommended this to many colleagues.",
        author: "Robert Miller, New Life Assembly"
      ),
      OpenStruct.new(
        title: "Great way to get started!",
        description: "Buzzsprout is unbelievably easy to use and it was really easy to link to iTunes. I like the data it provides you so that you know how your programme is going. I recommend it for anyone starting out on there first podcasting adventure!",
        author: "Jessica Ferriday, The Be Well Project"
      ),
      OpenStruct.new(
        title: "Great Podcast Provider",
        description: "Buzzsprout has provided us the podcast hosting experience that we were unable to find from other providers. Features that are easy to use, social media sharing, unlimited storages, and low monthly rates are just a few of the reasons that we will continue to work with Buzzsprout. If you are looking to start a podcast or are looking for a new hosting provider, definitely give Buzzsprout a chance as your solution!",
        author: "Bradley Swanson, Talking Twins"
      )
    ]
  end
end
