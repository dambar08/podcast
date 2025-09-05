// @stimulus-components/sound@2.0.1 downloaded from https://ga.jspm.io/npm:@stimulus-components/sound@2.0.1/dist/stimulus-sound.mjs

import{Controller as s}from"@hotwired/stimulus";const o=class _Sound extends s{connect(){this.sound=new Audio(this.urlValue)}play(){this.sound.play()}pause(){this.sound.pause()}reset(){this.sound.pause(),this.sound.load()}volume({params:s}){this.sound.volume=s.volume}muted({params:s}){this.sound.muted=s.muted}loop({params:s}){this.sound.loop=s.loop}};o.values={url:String};let u=o;export{u as default};

