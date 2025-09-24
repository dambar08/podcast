import { Application } from '@hotwired/stimulus'
import Notification from '@stimulus-components/notification'
import Dropdown from '@stimulus-components/dropdown'
import Dialog from '@stimulus-components/dialog'
import ScrollTo from '@stimulus-components/scroll-to'
import ContentLoader from '@stimulus-components/content-loader'
import Prefetch from '@stimulus-components/prefetch'
import AutoSubmit from '@stimulus-components/auto-submit'
import ScrollReveal from '@stimulus-components/scroll-reveal'
import RevealController from '@stimulus-components/reveal'
import AnimatedNumber from '@stimulus-components/animated-number';
import Carousel from '@stimulus-components/carousel';
import CharacterCounter from '@stimulus-components/character-counter';
import Chartjs from '@stimulus-components/chartjs';
import CheckboxSelectAll from '@stimulus-components/checkbox-select-all';
import Clipboard from '@stimulus-components/clipboard';
import ColorPicker from '@stimulus-components/color-picker';
import Lightbox from '@stimulus-components/lightbox';
import PasswordVisibility from '@stimulus-components/password-visibility';
import PlacesAutocomplete from 'stimulus-places-autocomplete';
import Popover from '@stimulus-components/popover';
import RailsNestedForm from '@stimulus-components/rails-nested-form';
import ReadMore from '@stimulus-components/read-more';
import RemoteRails from '@stimulus-components/remote-rails';
import ScrollProgress from '@stimulus-components/scroll-progress';
import Sortable from '@stimulus-components/sortable';
import TextareaAutogrow from 'stimulus-textarea-autogrow';
import Timeago from '@stimulus-components/timeago';
import Glow from 'stimulus-glow';

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

application.register('notification', Notification);
application.register('dropdown', Dropdown);
application.register('dialog', Dialog);
application.register('scroll-to', ScrollTo);
application.register('content-loader', ContentLoader);
application.register('prefetch', Prefetch);
application.register('auto-submit', AutoSubmit);
application.register('scroll-reveal', ScrollReveal);
application.register('character-counter', CharacterCounter);
application.register('animated-number', AnimatedNumber);
application.register('carousel', Carousel);
application.register('character-counter', CharacterCounter);
application.register('chartjs', Chartjs);
application.register('checkbox-select-all', CheckboxSelectAll);
application.register('clipboard', Clipboard);
application.register('color-picker', ColorPicker);
application.register('lightbox', Lightbox);
application.register('reveal', RevealController)
application.register('password-visibility', PasswordVisibility);
application.register('places-autocomplete', PlacesAutocomplete);
application.register('popover', Popover);
application.register('nested-form', RailsNestedForm);
application.register('read-more', ReadMore);
application.register('remote-rails', RemoteRails);
application.register('reveal-controller', RevealController);
application.register('scroll-progress', ScrollProgress);
application.register('sortable', Sortable);
application.register('textarea-autogrow', TextareaAutogrow);
application.register('timeago', Timeago);
application.register('glow', Glow);

export { application }
