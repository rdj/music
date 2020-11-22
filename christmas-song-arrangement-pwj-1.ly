\version "2.20.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")

\paper {
}

\header {
  title = "The Christmas Song (“Chestnuts”)"
  composer = "Robert Wells & Mel Torme"
  tagline = "Arrangement by Jonny May (Beg/Int)"
}

accf = \accidentalStyle forget
accd = \accidentalStyle default

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
      }
    }
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
            { \grace gs,8 <f a>4 \accf <e gs> \accd }
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
          }
        }
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
          }
        }
      }
    }
  >>

>>
  
