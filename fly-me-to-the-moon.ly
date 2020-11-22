\version "2.20.0"
\language "english"

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
  a2.:m a4:7
  d1:m
  g:7
  c2:maj7 f:7
  e:m a:7
  d1:m
  g:7
  c:maj7
  b2:m7.5- e:7.9-
  e1:m
  a:7
  d:m
  g:7
  c:maj7
  b2:m7.5- e:7.9-
}

\relative {
  \tempo "Medium Swing"

  \repeat volta 2 {
    c''4 b a g |
    f g a c |
    b a g f |
    e1 |
    %\break
    a4 g f e |
    d e f a |
    gs f e d |
    c2. cs4 |
    %\break
    d a' a2~ |
    a4 c2 b4 |
  }
  \alternative {
    {
      g1~ |
      g2. b,4 |
      %\break
      c f f2~ |
      f4 a2 g4 |
      f2 e2~ |
      e1 |
      %\break
    }
    {
      g1~ |
      g2. gs4 |
      a c, c2~ |
      c4 c2 d4 |
      %\break
      c1~ |
      c1 \bar "|."
    }
  }
}

>>
