\version "2.20.0"
\language "english"
\pointAndClickOff

\paper {
  % indent = 0
}

\layout {
  % ragged-last = ##t
}

\header {
  title = "Sonatina in G major"
  subsubtitle = \markup { "From" \italic "Zwei leichte Sonaten für das Pianoforte" "(1828)" }
  composer = "Ludwig van Beethoven (probably spurious)"
  opus = "Anh. 5, No. 1 (ca. 1790)"
  tagline = ##f
}

dolce = \markup { \italic "dolce" }

\new PianoStaff <<
  \new Staff = "upper" {
    \clef treble
    \key g \major
    \time 4/4
    \relative c'' {
      \tempo Moderato
      %% A
      g2\p \slashedGrace b8 a\( g a b\) |
      g4 g'8\(\> d\) d\( b\) b\( g\)\! |
      c2 \slashedGrace c8 b\( a b c\) |
      a4 d8\( e d b c a\) |
      g2 \slashedGrace b8 a\( g a b\) |
      c2 \slashedGrace fs8 e\( d e fs\) |
      g\( d\) e\( c\) b\( d\) c\( a\) |
      a2\( g4\) r |

      \repeat volta 2 {
        %% B
        a2\mf c8 b a b |
        d c a' g fs e d c |
        b2 d8 c b c |
        e d b' a g fs e d |
        c4 a'8 g fs e d c |
        b4 g'8 fs e d c b |
        a4 d,8 e fs g a b |
        c4 b8\( c d c a b\) |
        %% A Section again
        g2_\dolce \slashedGrace b8 a\( g a b\) |
        g4 g'8\(\> d\) d\( b\) b\( g\)\! |
        c2 \slashedGrace c8 b\( a b c\) |
        a4 d8\( e d b c a\) |
        g2 \slashedGrace b8 a\( g a b\) |
        c2 \slashedGrace fs8 e\( d e fs\) |
        g\( d\) e\( c\) b\( d\) c\( a\) |
        a2\( g4\) r |
      }

      %% C
      d'2\mf d4 d |
      d2\( g4 b\) |
      d2 d4 d |
      b2 r |
      d,2 d4 d |
      d2\( g4 b\) |
      d r fs, r |
      g r <g, b,> <g b,> |
      <g b,>2 <g b,> |
      <g b,>1\fermata

      \bar "|."
    }
  }

  \new Staff = "lower" {
    \clef bass
    \key g \major
    \time 4/4
    \relative c' {
      %% A
      <b g>2 <c fs,> |
      <b g>4 r r2 |
      <a d,> <g d> |
      <fs d>4 r r2 |
      g8 d' b d g, f' d f |
      g,\( e' c e\) g,\( c a c\) |
      b4 c d d, |
      g d g, r |

      %% B
      fs'8 d fs d g d g d |
      a'4 r r2 |
      g8 d g d a' d, a' d, |
      b'4 r r2 |
      <a d,>4 r r <fs d> |
      <g d> r r <e d> |
      <fs d> r r2 |
      r1 |

      %% A 
      <b g>2 <c fs,> |
      <b g>4 r r2 |
      <a d,>2 <g d> |
      <fs d>4 r r2 |
      g8 d' b d g, f' d f |
      g, e' c e g, c a c |
      b4 c d d, |
      g d g, r |

      %% C
      d'8\( a' c a\) d,\( a' c a\) |
      d, g b g d g b g |
      d fs a fs d fs a fs |
      d g b g d g b g |
      d a' c a d, a' c a |
      d, g b g d g b g |
      d fs a fs d a' c a |
      <b g>4 r g, g |
      g g' d b |
      g1\fermata
    }
  }
>>
