\version "2.20.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")

\paper {
  indent = 0
}

\header {
  title = "No. 11"
  subsubtitle = \markup { "From " \italic "Die ersten 12 Lectionen am Pianoforte" }
  composer = "Anton Diabelli"
  opus = "Op. 125, No. 11 (1825)"
  tagline = ##f
}

legato = \markup { \italic "legato" }

\new PianoStaff <<
  \new Staff = "upper" {
    \clef treble
    \key c \major
    \tempo Andantino
    \time 4/4
    \relative c'' {
      \repeat volta 2 {
          \partial 4 e8.\mf\(-2 f16 |
          g4\) c, a' c, |
          g'4.\( e8 c4\) d8\(-3 e |
          f4\) g, e' g, |
          d'4.\( b8 g4\) g |
          c-3\p c c8\( b a b\) |
          \break
          c4 c c8\( b a b\) |
          c4-1\( d e g\) |
          <d b>2 r4 
      }
      \repeat volta 2 {
        b8.\mf\(-2 c16 |
        d4\) g, e' g, |
        d'4.\( b8 g4\) a8\( b |
        c4\) d, b' d, |
        a'4.\( fs8 d4\) e8\p\( fs\) |
        g4-4 g-1 gs\(-2\> a\)-3\! |
        b-4 b-1 d\(-3\> c\)-2\! |
        <c e> <c d> d8\( e fs g\) |
        g,4 \acciaccatura b8 a4 g

        e'8.\(\mf f?16 | 
        g4\) c, a' c, |
        g'4.\( e8\) c4 d8\( e |
        f4\) g, e' g, |
        d'4. b8 g4

        a8\p\( b\) |
        c4 c c8\( b a b\) |
        c4 c c8\( b a b\) |
        c4\( e\) a,8\(\< b c d\)\! |
        c4\mf \acciaccatura e8 <d b>4 c
      }

      \break
      r |
      f8\p\( e f g e4\) r8 e |
      \acciaccatura e d\( c d e c4\) r8 e, |
      f\( e f \acciaccatura a g e4\) r8 e |
      \acciaccatura e d\( c d e c4\) r4 |
      \clef bass
      <c e,>4 r <c e,> <c e,> |
      <c e,>2 r2\fermata |
    }
  }

  \new Staff = "lower" {
    \clef bass
    \relative c {
      r4 |
      r <c e g> r <c f a> |
      r <c e g> r <c e g> |
      r <b d g> r <c e g> |
      r <g' b> <g b> r |
      e8_\legato g e g f g f g |
      e g e g f g f g |
      e g d g c, g' e g |
      r g, b d g,4

      r |
      r <g' b d> r <g c e> |
      r <g b d> r <g b d> |
      r <fs a> r <g b> |
      r <d fs a> <d fs a>

      r |
      \clef treble
      b'8_4^\legato d b d c_3 e c e |
      d_4 f? d f e_3 g e g |
      fs_4 a fs a <g b>4 r |
      \clef bass
      <d, b'> <d fs c'> <g b> r |
      c,8 g' e g c, a' f? a |
      c, g' e g c, g' e g |
      b, g' d g c, g' e g |
      r g,\( b d g4\)

      r |
      e8 g e g f g f g |
      e g e g f g f g |
      e g c, g' f4\( d\) |
      g <f g,> <e c>

      r |
      <b' d g> <b d g> <c g'> r |
      <g b f'> <g b f'> <c e> r |
      <b, d g> <b d g> <c g'> r |
      <g b f'> <g b f'> <c e> r |
      c r g e |
      c2 r2\fermata |
    }
  }
>>
