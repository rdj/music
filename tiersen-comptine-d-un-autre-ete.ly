\version "2.24.0"
\language "english"
\pointAndClickOff

twice = #(define-music-function (music) (ly:music?) #{ \repeat unfold 2 $music #})

smorz = \markup { \small \italic "smorzando" }

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
  indent = 0
}

\header {
  title = "Comptine d’un autre été, l’après-midi"
  subsubtitle = \markup { "From" \italic "Le fabuleux destin d’Amélie Poulain" "(2001)" }
  composer = "Yann Tiersen"
  tagline = ##f
}

global = {
  \key e \minor
  \time 4/4
  \tempo "Allegretto" 4 = 100
}

upper.intro = {
  \repeat unfold 4 { R1 | }
}

upper.A = \relative {
  r8 g'16 fs g8 b16 c b2 |
  r8 fs16 g fs8 g16 a g2 |
  r8 fs16 e fs8 b16 c b2 |
  r8 fs16 e fs2. |
}

upper.B = \relative {
  e''4. b8~ 2 |
  d4. b8~ 2 |
  fs'4. b,8~ 2 |
  fs'4. a,8~ 2 |
  <b g'>4. <g e'>8~ 2 |
  <b g'>4. <g d'>8~ 2 |
  <b fs'>4. <fs d'>8~ 2 |
  <a fs'>4. <fs d'>8~ 2 |
}

upper.C_body = \relative {
  \repeat unfold 4 { b'16-> e b' } b,-> e c-> e |
  \repeat unfold 4 { b-> d b' } b,-> d a-> d |
  \repeat unfold 4 { fs,-> b fs' } fs,-> b g-> b |
}

upper.C_first = \relative {
  \repeat unfold 4 { a'-> d a' } a,-> d g,-> d' |
}

upper.C = \relative {
  \upper.C_body
  \upper.C_first
}

upper.A′ = {
  \upper.A
}

upper.B′ = {
  \upper.B
}

upper.C_second = \relative {
  \repeat unfold 5 { a'-> d a' } g |
}

upper.C′ = \relative {
  \repeat volta 2 {
    \upper.C_body
  }
  \alternative {
    \upper.C_first
    \upper.C_second
  }
}

upper.end = \relative c' {
  <e g b e>1 |
}

lower.vamp = \relative c' {
  \twice { <e e,>8 b <e g,> b } |
  \twice { <d d,> b <d g,> b } |
  \twice { <d d,> b <d fs,> b } |
  \twice { <d d,> a <d fs,> a } |
}

lower.end = \relative c' {
  <d d,> a <d fs,> a <d d,> a <d fs,> r |
  e,1 |
}

dynamics = {
  s1*36 |
  s16_\smorz
}

reference.breaks = {
  s1*4 | \break
  \barNumberCheck #5
  s1*4 | \break
  \barNumberCheck #9
  s1*4 | \break
  \barNumberCheck #13
  s1*4 | \break
  \barNumberCheck #17
  s1*2 | \pageBreak
  \barNumberCheck #19
  s1*2 | \break
  \barNumberCheck #21
  s1*4 | \break
  \barNumberCheck #25
  s1*4 | \break
  \barNumberCheck #29
  s1*4 | \break
  \barNumberCheck #33
  s1*3 | \break
  \barNumberCheck #36
}

\score {
  \new PianoStaff <<
    \new Staff = "up" {
      \global
      \clef treble
      \upper.intro
      \repeat volta 2 {
        \upper.A
      }
      \upper.B
      \repeat volta 2 {
        \upper.C
      }
      \transpose c c' {
        \ottava #1
        \set Staff.ottavation = #"8va"
        \repeat volta 2 {
          \upper.A′
        }
        \upper.B′
        \upper.C′
      }
      \ottava #0
      \upper.end
    }
    \new Dynamics {
      \global
      \dynamics
    }
    \new Staff = "down" {
      \global
      \clef bass
      \repeat unfold 9 { \lower.vamp }
      \lower.end
      \bar "|."
    }
    \new Dynamics {
      \global
      \reference.breaks
    }
  >>
}
