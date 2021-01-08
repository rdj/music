\version "2.20.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")

\paper {
  indent = 0
}

\layout {
  ragged-last = ##f
  %#(layout-set-staff-size 25.2)
}

\header {
  title = "Cruella Da Vil"
  subtitle = \markup { "from" \italic "101 Dalmations" }
  composer = "Mel Leven"
  tagline = ""
}

trip = #(define-music-function (music) (ly:music?) #{ \tuplet 3/2 #music #})

\include "rhythm-mark.ly"

<<

  \chords {
    \set chordChanges = ##t

    s8
    c1:7
    f2:7 bf:7
    c1:7
    f2:7 bf:7
    c:7 f:7
    c:7 a:7
    % First ending
    d2:7 af:7
    g1:7
    % Second ending
    d2:7 g:7
    c1:7

    % B section
    e:7
    a:m
    e:7
    a:m
    d:7
    d:7
    af:7
    g:7

    % A section
    c1:7
    f2:7 bf:7
    c1:7
    f2:7 bf:7
    c:7 f:7
    c:7 a:7
    % Second ending
    d2:7 g:7
    c1:7
    
  }

  \new Staff {
    \clef treble
    \key c \major
    \time 4/4
    \set Score.markFormatter = #format-mark-box-alphabet
    \relative c' {
      \rhythmMark #"" \rhyMarkIIEighths \rhyMarkTriplets
      \partial 8
      ds8 |
      \repeat volta  2 {
        e g a bf~ 4. gs8 |
        a c d ef~ 4. ef,8 | 
        e g a bf~ bf bf4 gs8 |
        a c d ef~ 4. c8 | \break
        e c d c ef c d c |
        e2.~ 8 a, | 
      }
      \alternative {
        {
          e' ef4 c8 ef d c d~ | \break
          2.~ 8 ds, |
        }
        {
          e' ef4 a,8 ef' d c c~ |
          2.~ 8 c \bar "||" | \break
        }
      }
      
      \mark #2
      e f d e c d b c |
      a a4.~ a c8 |
      e f d e c d b c |
      a2.~ 8 c | \break
      d d \trip { d c d~ } 4. c8 |
      d d \trip { d c d~ } 2 | 
      ef8 ef d c ef ef d c |
      d2.~ 8 ds, | \break

      \mark #1
      e g a bf~ 4. gs8 |
      a c d ef~ 4. ef,8 |
      e g a bf~ bf bf4 gs8 |
      a c d ef~ 4. c8 | \break
      e c d c ef c d c |
      e2.~ 8 a, | 
      e' ef4 c8 ef d c c~ |
      1 \bar "|." |
    }
  }

>>


