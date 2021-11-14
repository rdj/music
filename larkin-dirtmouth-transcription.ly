\version "2.20.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
  indent = 0
}

\header {
  title = "Dirtmouth"
  subsubtitle = \markup { "From" \italic "Hollow Knight" "(2017)" }
  composer = "Christopher Larkin"
  tagline = ##f
}

\new PianoStaff <<
  \new Staff = "upper" {
    \clef treble
    \key e \minor
    \time 4/4
    \relative c' {
      fs1~ |
      2 \tuplet 3/2 { fs4 g a } |
      fs2.~ 8 b,8 |
      cs1 | \break
      fs~ |
      2 \tuplet 3/2 { fs4 g a } |
      e2.~ 8 g16 fs |
      g2.~ <g b,>4 | \break
      <fs~ fs'~>1 |
      q2 \tuplet 3/2 { <fs fs'>4 <g g'> <a a'> } |
      <fs fs'>2.~ q8 <b, b'> |
      <cs cs'>1 | \break
      <e e'> |
      <fs fs'>2 <g g'>4 <a a'> |
      <b b'>2.~ q8 <c c'> |
      <b b'>2 <g g'> |
      fs16 fs'16. fs16 fs'32 r4 r8 r16 fs fs,8. fs,16~ |
      8. r16 r4 r2 |
      fs16 fs'16. fs16 fs'32 r4 r4 r8 <b,, b'> |
      <cs cs'>2 e' | \break
      e r |
      fs,, \tuplet 3/2 { fs4 g a } |
      fs2 d |
      e r | \break
      R1 |
      r2 \tuplet 3/2 { fs4 g a } |
      fs1 |
      g2. a4 | \break
      b1~ |
      2 \tuplet 3/2 { b4 c d } |
      b2 cs |
      d1 | \break
      e2 r |
      R1 |
      <e a,>2\arpeggio \tuplet 3/2 { a,4 bf c } |
      bf2 r2 | \break
      R1 |
      \stemUp
      fs8 g a b e fs g b |
      e1 |
    }
    \bar "|."
  }

  \new Staff = "lower" {
    \clef bass
    \key e \minor
    \relative c {
      e,8\( b' e fs g b g fs\) |
      \repeat unfold 4 {
        e, b' e fs g b g fs |
      }
      d, a' e' fs g b g fs |
      c, g' e' fs g  b g fs |
      c, g' e' g c e, d,4 |
      \repeat unfold 4 {
        e8 b' e fs g b g fs |
      }
      c, g' c d e g e d |
      d fs g b g b g fs |
      f, c' f a c f c a |
      g, d' g b d b4 r8 |
      \repeat unfold 4 {
        e,,8 b' e fs g b g fs |
      }
      c g' d' e g d e c, |
      b fs' b cs d cs b fs |
      g, d' g b r b g d |
      a e' a d cs a e a, |
      e g b e fs e b g |
      c, g' c e fs e c g |
      a, a' c e fs e c e |
      g,, g' b e g e fs,4 |
      e8 b' e e fs e b g |
      c, g' c e g e c g |
      a, a' cs e fs e cs a |
      g, g' b e g e b e |
      f, c' f a c e c a |
      g, b d b' e2 |
      a,,8 e' a c f c a f |
      bf, f bf d f bf f d |
      <<
        { c8 g c e g e c4 } \\
        { c,1 }
      >> |
      e'8 b'
      \change Staff = "upper"
      e fs g b e g |
      b1 |
    }
  }
>>
