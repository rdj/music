\version "2.20.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")

\paper {
  indent = 0
}

\header {
  title = "Blueberry Hill (Intro)"
  composer = "Vincent Rose by way of Fats Domino"
  tagline = "Transcribed from YouTube channel Walk That Bass"
}

gr = #(define-music-function (music) (ly:music?) #{ \acciaccatura #music #})
trip = #(define-music-function (music) (ly:music?) #{ \tuplet 3/2 #music #})

makePercent =
#(define-music-function (parser location note) (ly:music?)
   "Make a percent repeat the same length as NOTE."
   (make-music 'PercentEvent
               'length (ly:music-length note)))

\include "rhythm-mark.ly"

<<

  \chords {
    \set chordChanges = ##t    
    \set majorSevenSymbol = "maj7"

    c2.:7
    f1:7
    f:7
    c:7
    c:7
    g:7
    g:7
    c:7
    c:7
    f:7
    f:7
    c:7
    c:7
    g:7
    g:7
    c:7
  }    

  \new Staff {
    \clef treble
    \key c \major
    \time 4/4
    \relative c' {
      \once \override Score.RehearsalMark.X-offset = #5
      \rhythmMark #"Boogie Woogie" \rhyMarkIIEighths \rhyMarkSlurredTriplets
      \partial 2.
      c8 c \gr ef \trip { e c \gr ef e } \trip {g e g} |
      \gr af <a c>2.:16 \trip { <c af>8 <c a> <d bf> } |
      <ef c> f, <bf d> \gr af <a c>4 \trip { c16 bf g } \trip { fs8 <f g> ef } |
      <g e>2.:16 \trip { <g e>8 <fs ef> <f d> } |
      \trip { <c e> r c } \gr ef \trip { <e g> c <e g> } \trip { <f a> c <f a> } \trip { <fs bf> c <fs bf> } |
      <d f g b>1:16 |
      r8 g \gr ef' <e g> <f a> <ef g> e32 ef c g <f c'>8 <ef c'> |
      <e c'>4 \trip { <c e>8 <d f> <e g> } <f a>4 \trip { <f a>8 <e g> <d f> } |
      <c e> r c c \gr ef \trip { e c e } \trip { g e g } |
      \gr af <a ef'>1:16 |
      r8 \trip { c'16 bf g } \trip { fs8 <f g> ef } \trip { c bf g } \trip { fs <f g> ef } |
      <e bf'>1:16 |
      r8 c' \gr ef <e g> <f a> <g bf> c, \trip { <b d> <bf df> <a c> } |
      <g b f'>1:16 |
      r8 g \gr ef' <e g> <f a> <ef g> e32 ef c g <f c'>8 <ef c'> |
      <e c'>4 \trip { <e c>8 <f d> <g e> } <a f>4 \trip { <a f>8 <g e> <f d> } |
      c4
      \bar "||"
    }
  }

>>

<<

  \new Staff {
    \clef bass
    \key c \major
    \time 4/4
    \fixed c, {
      <>^\markup \italic { Example bass line }
      \partial 2.
      r2. |
      f4 f'8 \gr af a c'4 \trip { af8 a c' } |
      <>^\markup \italic { et cetera }
      \makePercent 1
    }
  }

>>

\markup Verse

\new ChordNames \with {
  \override BarLine.bar-extent = #'(-2 . 2)
  \consists "Bar_engraver"
}
\chordmode {
  \set chordChanges = ##f
  \set majorSevenSymbol = "maj7"

  f1 f c c
  g g c c2 \parenthesize g2:7
}

\markup Bridge

  
\new ChordNames \with {
  \override BarLine.bar-extent = #'(-2 . 2)
  \consists "Bar_engraver"
}
\chordmode {
  \set chordChanges = ##f
  \set majorSevenSymbol = "maj7"

  c1 c2 g:7 c1 c2 b2
  e1:m e2:m fs:m7.5- b1:7 g2:7 c
}
  
