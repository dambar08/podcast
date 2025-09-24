// Entry point for the build script in your package.json

import "@hotwired/turbo-rails"
import "./controllers"

import "trix"
import "@rails/actiontext"

import smoothscroll from 'smoothscroll-polyfill';
smoothscroll.polyfill();
