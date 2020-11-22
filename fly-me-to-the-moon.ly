\version "2.20.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")

\paper {
  indent = 0
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))  
}

\layout {
  ragged-last = ##t
  #(layout-set-staff-size 25.2)
}

\header {
  title = "Fly Me to the Moon"
  composer = "Bart Howard"
  tagline = ""
}

<<

\chords {
  \set chordChanges = ##t    
  \set minorChordModifier = \markup { "-" }
  %\set majorSevenSymbol = "Maj7"
    
  a1:m7
  d:m7
  g:7
  c2:maj7 gf2:7
  f1:maj7
  b:m7.5-
  e:7.9-
  a2.:m7 a4:7
  d1:m7
  g:7
  c2:maj7 f:7
  e:m7 a:7
  d1:m7
  g:7
  c:maj7
  b2:m7.5- e:7.9-
  e1:m7
  a:7
  d:m7
  g:7
  c:maj7
  b2:m7.5- e:7.9-
}

\new Voice = "melody" {
  \relative {
    \tempo "Medium Swing"

    \repeat volta 2 {
      c''4 b a g |
      f g a c |
      b a g f |
      e1 |
      \break
      a4 g f e |
      d e f a |
      gs f e d |
      c2. cs4 |
      \break
      d a' a2~ |
      a4 c2 b4 |
    }
    \alternative {
      {
        g1~ |
        g2. b,4 |
        \break
        c f f2~ |
        f4 a2 g4 |
        f2 e2~ |
        e1 |
        \break
      }
      {
        g1~ |
        g2. gs4 |
        a c, c2~ |
        c4 c2 d4 |
        \break
        c1~ |
        c1 \bar "|."
      }
    }
  }
}

\new Lyrics \lyricsto "melody" {
  \lyricmode {
    \repeat volta 2 {
      <<
        {
          Fly me to the moon,
          and let me play a- mong the stars.
          Let me see what spring is like
          on Ju- pi- ter and Mars.
          In o- ther words,
          hold my
        }
        \new Lyrics \lyricsto "melody" {
          Fill my heart with song,
          and let me sing for- e- ver more.
          You are all I long for,
          all I wor- ship and a- dore.
          In o- ther words,
          please be
        }
      >>
    }
    \alternative {
      {
        hand.
        In o- ther words,
        ba- by, kiss me.
      }
      {
        true.
        In o- ther words,
        I love you.
      }
    }
  }
}

>>
