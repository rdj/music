\version "2.20.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")

\paper {
  indent = 0
}

\header {
  title = "The Christmas Song (“Chestnuts”)"
  composer = "Robert Wells & Mel Torme"
  tagline = "Arrangement by Jonny May (Beg/Int)"
}

daCapo = {
  \once \override Score.RehearsalMark.self-alignment-X = #RIGHT
  \once \override Score.RehearsalMark.break-visibility = #begin-of-line-invisible
  \override Score.RehearsalMark.direction = #DOWN
  \once \override Score.RehearsalMark.font-size = #1
  \mark \markup { { \lower #1 "D.C. al Coda" { \musicglyph #"scripts.coda"} } }
}

toCoda = {
  \once \override Score.RehearsalMark.self-alignment-X = #RIGHT
  \once \override Score.RehearsalMark.break-visibility = #begin-of-line-invisible
  \override Score.RehearsalMark.direction = #UP
  \once \override Score.RehearsalMark.font-size = #1
  \mark \markup { { \lower #1 "To Coda" { \musicglyph #"scripts.coda"} } }
}

coda = {
  \override Staff.TimeSignature #'stencil = ##f
  \mark \markup \musicglyph #"scripts.coda"
}

forceAccs =
  #(define-music-function (music) (ly:music?)
    #{
      \accidentalStyle forget
      #music
      \accidentalStyle default
    #}
  )

<<

  \chords {
    \set chordChanges = ##t    
    \set majorSevenSymbol = "maj7"

    \repeat volta 2 {
      c2:6.9
      d:m6 |
      e:m7
      g:13 |
      g:m7
      c:7 |
      f:maj7
      e:7 |
      \break
      
      a:m7
      f:m6/af |
      e:m/g
      fs4:m7 b:7 |
    }
    \alternative {
      {
        e2:maj7
        f4:m7 bf:7 |
        ef2:maj7
        d4:m7 g:7.9- |
        \break
      }
      {
        e4:m7 a:7
        d:m7 g:9 |
        c1:6.9 |
      }
    }

    g2:m7
    c:7.9- |
    f:maj7
    d:m7 |
    \break

    g:m7
    c:7.9- |
    f:maj7
    f:6 |
    f:m7
    bf:9 |
    ef:maj7
    ef:6 |
    \break

    a:m7
    d:7 |
    g:9sus4
    g:9 |
    \break
  }

  \new PianoStaff <<
    \new Staff = "upper" {
      \clef treble
      \key c \major
      \time 4/4
      \relative c' {
        \repeat volta 2 {
          <d g c>4 c''
          <c, f b>8 a' \grace f g f |
          \grace as, <e' b g> e <e b g>4
          <<
            e2
            \\
            { \grace gs,8 <f a>4 \forceAccs <e gs> }
          >> |
          <c' bf> a'
          <g bf,>8 f \grace gs, <e' a,> d |
          <c a e>2
          <gs d> |
          \break

          <g c>4 c
          <d c af>8 d c d |
          <e b g>4 g8 a
          <b cs,>4 ds,8 a' |
        }
        \alternative {
          {
            <gs fs ds>4 <gs fs cs>
            <bf c,>8 af <g d> f |
            <<
              g2
              \\
              { <f d>4 <ef c> }
            >>
            <g a,>8 f \grace d <e af,> d |
            \break
          }
          {
            <g b,>8 e <a cs,>
            g <f a,>4 <b, a f> |
            <c g d>2
            r8 c b c |
            \bar "||"
          }
        }

        bf'4 <d, bf>
        <df bf>8 a' g f |
        g4 <e a,>
        <d a>8 c b c |
        \break

        <bf' d,>8 a <bf d,> a
        <bf df,> a g f |
        g4 <e a,>
        <d a>8 c b c |
        af'8 g <af ef c>4
        <d, c>8 g f ef |
        f4 <d g,>
        <c g>8 ef f ef |
        \break

        <d c g>8 d d d
        \grace as <d b e,>4 <d b e,>8 d |
        <d c f,>4 <c f, e>
        <b a f> <e b f> |
        \bar "||"
        \break
      }
    }

    \new Staff = "lower" {
      \clef bass

      \fixed c, {
        \repeat volta 2 { 
          <c g>4 <e' a'>
          <d a> <f' c''> |
          <e b> <g' d''>
          <g f'> <f' b'> |
          <g f'> <f' bf'>
          <c' bf'> <e' bf'> |
          <f c'> <e' a'>
          <e b> <d' gs'> |
          \break

          <a e'> <g' c''>
          af <af' d''> |
          \toCoda
          <g e'> <e' b'>
          <fs e'> <b ds'> |
        }
        \alternative {
          {
            <e b> <cs' gs'>
            <f ef'> <bf af'> |
            <ef bf> <g' c''>
            <d' c''> <g' b'> |
            \break
          }
          {
            <e' g'> <a g'>
            <d' f'> <g f'> |
            <c' a'>2
            c
            \bar "||"
          }
        }

        <g f'>4 <f' bf'>
        <c' bf'> <e' bf'> |
        <f e'> <e' a'>
        <d' c''> <f' c''> |
        \break

        <g f'> <f' bf'>
        <c' bf'> <e' bf'> |
        <f e'> <e' a'>
        <f d'> <d' a'> |
        <f ef'> <ef' af'>
        <bf af'> <d' af'> |
        <ef bf> <d' g'>
        <ef bf> <c' g'> |
        \break

        <a g'> <g' c''>
        <d' g' c''> <fs' c''> |
        <g f'> <f' c''>
        <g f'> <f' b'> |
        \bar "||"
        \break
        \daCapo
      }
    }
  >>

>>

% CODA

<<

  \chords {
    e2:m/g
    fs4:7 b:7 |
    e:m7 a:m7
    d:m7 g:9 |
    c1:6.9 |
  }

  \new PianoStaff <<
    \new Staff = "upper" {
      \coda
      \clef treble

      \relative e'' {
        <e b g>4 g8 a
        <b cs,>4 c8 a |
        <g b,>4 c,
        <c f,> <d af f> |
        <c g d>2
        <d g c>
      }
    }

    \new Staff = "lower" {
      \coda
      \clef bass

      \fixed c, {
        <g e'>4 <e' b'>
        <fs e'> <b ds'> |
        <e' g'> <a g'>
        <d' f'> <g f'> |
        <c' a'>2
        c |
        \bar "|."
      }
    }
  >>

>>

% Having trouble deciding which grace note to use in this tune. The
% original just uses small notes with no ties or slashes, which I
% found a little hard to follow, but then I found a way to tweak the
% grace notes so they are smaller, and I find that acceptable.
%
% Another option is to explicitly slur the grace note to the proper
% note in the chord, e.g. `\grace as( <g) b>`, but the slur ends up
% a bit ugly in this case, there is a bug filed about it.
%
%   grace = small note
%   slashedGrace = slashed grace note
%   appoggiatura = slurred grace note
%   acciaccatura = slurred slashed grace note
\layout {
  \context {
    \Score
    \with{
      $(add-grace-property 'Voice 'NoteHead 'font-size '-5)
      $(add-grace-property 'Voice 'Slur 'height-limit '1)
      $(add-grace-property 'Voice 'Flag 'font-size '-5)
      $(add-grace-property 'Voice 'Stem 'length '4)
      $(add-grace-property 'Voice 'Beam 'beam-thickness '0.3)
      $(add-grace-property 'Voice 'Beam 'length-fraction '0.5)
      $(add-grace-property 'Voice 'Beam 'shorten '1)
    }
  }
}
