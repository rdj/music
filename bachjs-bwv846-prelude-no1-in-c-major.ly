\version "2.20.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
  indent = 0
  % page-breaking = #ly:one-page-breaking
}

\header {
  title = "Prelude No. 1 in C major"
  subsubtitle = \markup { "from" \italic { "The Well-Tempered Clavier, Book I" } "(1722)" }
  composer = "Johann Sebastian Bach"
  opus = "Prelude from BWV 846 (1722)"
  tagline = ##f
}

global = {
  \key c \major
  \time 4/4
}

twice = #(define-music-function (music) (ly:music?) #{ \repeat unfold 2 $music #})
rhpat = #(define-music-function (music) (ly:music?) #{ \twice { r8 \twice $music } #})


upperStaff = {
  \relative e'' {
    \rhpat { g,16  c  e  } |
    \rhpat { a,16  d  f  } |
    \rhpat { g,16  d' f  } |
    \rhpat { g,16  c  e  } |
    \rhpat { a,16  e' a  } |
    \rhpat { fs,16 a  d  } |
    \rhpat { g,16  d' g  } |
    \rhpat { e,16  g  c  } |
    \rhpat { e,16  g  c  } |
    \rhpat { d,16  fs c' } |
    \rhpat { d,16  g  b  } |
    \rhpat { e,16  g  cs } |
    \rhpat { d,16  a' d  } |
    \rhpat { d,16  f  b  } |
    \rhpat { c,16  g' c  } |
    \rhpat { a,16  c  f  } |
    \rhpat { a,16  c  f  } |
    \rhpat { g,16  b  f' } |
    \rhpat { g,16  c  e  } |
    \rhpat { bf16  c  e  } |
    \rhpat { a,16  c  e  } |
    \rhpat { a,16  c  ef } |
    \footnote #'(-0.5 . 1) \markup \justify { Between mm. 22–23, some editions include the “Schwencke measure” with G in the bass voice, named for the German copyist whose 1783 edition is its earliest record. Notably, Gounod’s “Ave Maria” (1853) includes it when quoting this prelude. It does not appear in the Bach holograph and is not included here. } Staff.BarLine
    \rhpat { b16   c  d  } |
    \rhpat { g,16  b  d  } |
    \rhpat { g,16  c  e  } |
    \rhpat { g,16  c  f  } |
    \rhpat { g,16  b  f' } |
    \rhpat { a,16  c  fs } |
    \rhpat { g,16  c  g' } |
    \rhpat { g,16  c  f  } |
    \rhpat { g,16  b  f' } |
    \rhpat { g,16  bf e  } |
    r8 f,16 a c f c a
    \stemUp
    c
    \change Staff = "down"
    a f a f d f d |
    \stemNeutral
    \change Staff = "up"
    r8 g'16 b d f d b d b g b d, f e d |
    <e g c>1\fermata
   }
  \bar "|."
}

lowerStaff = {
  <<
    \new Voice {
      \voiceOne
      \relative c' {
        \twice { r16 e8.~ 4 } |
        \twice { r16 d8.~ 4 } |
        \twice { r16 d8.~ 4 } |
        \twice { r16 e8.~ 4 } |
        \twice { r16 e8.~ 4 } |
        \twice { r16 d8.~ 4 } |
        \twice { r16 d8.~ 4 } |
        \twice { r16 c8.~ 4 } |
        \twice { r16 c8.~ 4 } |
        \twice { r16 a8.~ 4 } |
        \twice { r16 b8.~ 4 } |
        \twice { r16 bf8.~ 4 } |
        \twice { r16 a8.~ 4 } |
        \twice { r16 af8.~ 4 } |
        \twice { r16 g8.~ 4 } |
        \twice { r16 f8.~ 4 } |
        \twice { r16 f8.~ 4 } |
        \twice { r16 d8.~ 4 } |
        \twice { r16 e8.~ 4 } |
        \twice { r16 g8.~ 4 } |
        \twice { r16 f8.~ 4 } |
        \twice { r16 c8.~ 4 } |
        \twice { r16 f8.~ 4 } |
        \twice { r16 f8.~ 4 } |
        \twice { r16 e8.~ 4 } |
        \twice { r16 d8.~ 4 } |
        \twice { r16 d8.~ 4 } |
        \twice { r16 ef8.~ 4 } |
        \twice { r16 e8.~ 4 } |
        \twice { r16 d8.~ 4 } |
        \twice { r16 d8.~ 4 } |
        \twice { r16 c8.~ 4 } |
        r16 c8.~ 4~ 2 |
        r16 b8.~ 4~ 2 |
        c1 |
      }
    }

    \new Voice {
      \voiceTwo
      \relative c' {
        \twice { c2 } |
        \twice { c2 } |
        \twice { b2 } |
        \twice { c2 } |
        \twice { c2 } |
        \twice { c2 } |
        \twice { b2 } |
        \twice { b2 } |
        \twice { a2 } |
        \twice { d,2 } |
        \twice { g2 } |
        \twice { g2 } |
        \twice { f2 } |
        \twice { f2 } |
        \twice { e2 } |
        \twice { e2 } |
        \twice { d2 } |
        \twice { g,2 } |
        \twice { c2 } |
        \twice { c2 } |
        \twice { f,2 } |
        \twice { fs2 } |
        \twice { af2 } |
        \twice { g2 } |
        \twice { g2 } |
        \twice { g2 } |
        \twice { g2 } |
        \twice { g2 } |
        \twice { g2 } |
        \twice { g2 } |
        \twice { g2 } |
        \twice { c,2 } |
        c2~ c2 |
        c2~ c2 |
        c1_\fermata |
      }
    }
  >>
}

dynamics = {
}

pedalMarks = {
}

\score {
  \new PianoStaff <<
    \new Staff = "up" {
      \clef treble
      \global
      \upperStaff
    }
    \new Dynamics {
      \global
      \dynamics
    }
    \new Staff = "down" {
      \clef bass
      \global
      \lowerStaff
    }
    \new Dynamics {
      \global
      \pedalMarks
    }
  >>
}
