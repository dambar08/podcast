# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.2
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin "chartkick", to: "chartkick.js"
pin "Chart.bundle", to: "Chart.bundle.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "tw-animate-css" # @1.3.7
pin "trix"
pin "@rails/actiontext", to: "actiontext.esm.js"
pin "@rails/request.js", to: "@rails--request.js.js" # @0.0.12
pin "@stimulus-components/sortable", to: "@stimulus-components--sortable.js" # @5.0.2
pin "sortablejs" # @1.15.6
pin "@stimulus-components/sound", to: "@stimulus-components--sound.js" # @2.0.1
pin "@stimulus-components/dropdown", to: "@stimulus-components--dropdown.js" # @3.0.0
pin "stimulus-use" # @0.52.3
pin "@stimulus-components/dialog", to: "@stimulus-components--dialog.js" # @1.0.1
pin "@stimulus-components/chartjs", to: "@stimulus-components--chartjs.js" # @6.0.1
pin "@kurkle/color", to: "@kurkle--color.js" # @0.3.4
pin "chart.js" # @4.5.0
pin "@stimulus-components/rails-nested-form", to: "@stimulus-components--rails-nested-form.js" # @5.0.0
pin "clsx" # @2.1.1
pin "tailwind-merge" # @3.3.1
