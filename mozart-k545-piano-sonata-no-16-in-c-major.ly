\version "2.20.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
}

%% Mozart catalogued this 1788 work as "Eine kleine klavier Sonate für
%% anfänger" (a little piano sonata for beginners). The autograph is
%% lost. It was first published posthumously.
\header {
  title = "Piano Sonata No. 16"
  subsubtitle = \markup { \italic "Sonate facile pour le pianoforte" "(1805)" }
  composer = "Wolfgang Amadeus Mozart"
  opus = "K. 545 (1788)"
  tagline = ##f
}

\include "mozart-k545-piano-sonata-no-16-in-c-major/01-allegro.ly"

\pageBreak

\include "mozart-k545-piano-sonata-no-16-in-c-major/02-andante.ly"

\pageBreak

\include "mozart-k545-piano-sonata-no-16-in-c-major/03-rondo-allegretto.ly"
