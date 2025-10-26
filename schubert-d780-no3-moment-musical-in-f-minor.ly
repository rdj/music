\version "2.24.4"
\language "english"
\pointAndClickOff

X = #(define-music-function (num music) (integer? ly:music?) #{ \repeat unfold $num $music #})

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
  % page-breaking = #ly:one-page-breaking
  % markup-system-spacing = #0
  % top-margin = #4
  % bottom-margin = #4
}

\header {
  title = "Moment Musical in F minor"
  subsubtitle = \markup { "No. 3 from" \italic "Six Moments Musicaux" "(1828)" }
  composer = "Franz Schubert"
  opus = "D. 780, No. 3"
  tagline = ##f
}

\layout {
  \context {
    \Score
    barNumberVisibility = #first-bar-number-invisible-save-broken-bars
    % \override BarNumber.break-visibility = #all-visible
  }
  \context {
    \PianoStaff
    \accidentalStyle piano
    printKeyCancellation = ##f
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Schubert - Moment musical in F minor, D. 780, No. 3
%%
%% Allegro moderato
%% Intro |: A :||: B :||: C :| A′ Coda


global = {
  \tempo "Allegro moderato"
  \key f \minor
  \time 2/4
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Intro = mm. 1-2 (Allegro moderato, p)

upper.intro = {
  \clef treble
  R2 * 2 |
}

lower.intro = \relative {
  \clef bass
  \X 2 { f8-.[ <c' f>-. f,8-. <c' f>-.] | }
}

between.intro = {
  s2\p | s2 |
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% A = mm. 3-10

upper.A = \relative {
  \barNumberCheck 3
  \grace bf'16 af8-. af16( bf) af8-. g-. |
  \X 2 { \grace { af16( bf } <af c>4->) } |
  \grace bf16 af8-. af16( bf) af8-. <g c>-. |
  \X 2 { \grace c16 <f af,>4-> }
  <<
    {
      \grace gf16 f8 f16( gf! f8) f |
      f[( bf16])
    }
    \\
    {
      af,8[ af a a] |
      bf8.
    }
  >>
  r16 <af f'>4 |
  <c af>16[\( <bf g> <af f> <bf g>]\)
  <<
    { c( df) c( e) }
    \\
    { af,8 <bf g> }
  >> |
  <af c f>4 q |
}

lower.A = \relative {
  \barNumberCheck 3
  \X 2 {
    f8[ <c' f> f, <c' e>] |
    f,[ <c' f> f, <c' f>] |
  }
  df, <df' f> c, <c' ef f> |
  bf, <bf' df f> f <c' f> |
  c, <c' f> c, <c' e> |
  f, <c' f> f, <c' f> |
}

between.A = {
  \barNumberCheck 3
  s2 * 8 |
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% B = mm. 11-18

upper.B = \relative {
  \barNumberCheck 11
  c''4-> c-> |
  c16 df ef df df8. c16 |
  \grace c16 bf8 bf c16\( bf af bf\) |
  bf4( c) |
  \X 2 { \grace ef16 <c af'>4-> } |
  <g' ef>16 <f df> <e c> <f df> q4 |
  <<
    { f16( ef) <ef df>4 q8 }
    \\
    { <df g,>8 g,16[\( af bf8]\) af16 g }
  >> |
  <af c ef>4 q |
}

lower.B = \relative {
  \barNumberCheck 11
  % Clef change after bar line
  \once \override Score.BreakAlignment.break-align-orders = #(make-vector 3 '(staff-bar clef key-signature)) \clef "bass"
  \clef treble
  af8[ <c ef af> af q] |
  af[ <bf ef g> af q] |
  af[ <df ef g> af q] |
  af[ <c ef af> af q] |
  af[ <c ef af> af q] |
  \clef bass
  \X 2 { df, <df' f> } |
  \X 2 { ef, <bf' df ef> } |
  \X 2 { af <c ef> } |
}

between.B = {
  \barNumberCheck 11
  s2 * 8 |
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% C = mm. 19-26 (f)

upper.C = \relative {
  \barNumberCheck 19
  <e'' c bf g>4-> q-> |
  <<
    { \grace f16 af8 af16 g f8 ef16 df }
    \\
    { <c af>8 q4. }
  >> ||
  \once \stemDown
  <c bf g>4-> <e c bf g>-> |
  <<
    { \grace f16 af8 af16 g f8 ef16 df }
    \\
    { <c af>8 q4. }
  >> ||
  <c af>4 <c gf> |
  <<
    { c16 df ef df } \\ f,4
  >>
  <df' f,>8 <c ef,>16( <bf df,>) |
  <af c,>8 q q16\( <bf df,> <c ef,> <bf df,>\) |
  <af c,>4 q |
}

lower.C = \relative {
  \barNumberCheck 19
  \X 2 { c8 <c' e> } |
  \X 2 { c,8 <c' f> } |
  \X 2 { c,8 <c' e> } |
  c,8 <c' f> f, q |
  af, <af' c> a, <gf' c> |
  bf, <f' bf> df, <df' f> |
  ef, <ef' af> ef, <ef' g> |
  \X 2 { af, <ef' af> } |
}

between.C = {
  \barNumberCheck 19
  s2\f |
  s2 * 3 |
  s4\p s16\< s8 s16\! |
  s16\> s8 s16\! s4 |
  s2 * 2 |
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% A′ = mm. 27-34 (pp)

upper.A′ = \relative {
  \barNumberCheck 27
  \grace bf'16 af8 af16( bf) af8-. g-. |
  \X 2 { \grace { af16( bf } <af c>4) } |
  \grace bf16 af8 af16( bf) af8-. <g c>-. |
  \X 2 { \grace c16 <f af,>4-> }
  <<
    {
      \grace gf16 f8 f16( gf! f8) f |
      f[( bf16])
    }
    \\
    {
      af,8[ af a a] |
      bf8.
    }
  >>
  r16 <af f'>4 |
  <<
    {   <c af>16[\( <bf g> <af f> <bf g>] c df c e\) }
    \\
    { s4 af,8 <bf g> }
  >> |
  <af c f>4 q |
}

lower.A′ = \relative {
  \barNumberCheck 27
  \X 2 {
    f8[ <c' f> f, <c' e>] |
    f,[ <c' f> f, <c' f>] |
  }
  df, <df' f> c, <c' ef f> |
  bf, <bf' df f> f <af c f> |
  c, <c' f> c, <c' e> |
  f, <c' f> f, <c' f> |
}

between.A′ = {
  \barNumberCheck 27
  s2\pp |
  s2 * 3 |
  s4 s8\< s8\! |
  s8\> s16 s16\! s4 |
  s2 * 2 |
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Coda = mm. 35-54

upper.coda_soprano = \relative {
  \grace af''16 g8 g16\( af g8\) g |
  bf8 af4 g16 f |
  \grace df16 c8-. c16\( df c8\) e-. |
  \oneVoice <f c af>4 q | \voiceOne
  \grace af16 g8 g16\( af g8\) g( |
  bf) af4\( g16 f\) |
  \X 2 { \grace d16 c8 c16\( d c8 d\) | }
  \grace d16 c8 c16\( d c8 e\) |
  \oneVoice <f a,>4 q | \voiceOne
  \X 2 {
    \grace d16 c8 c16\( d c8 a\) |
    \oneVoice <bf e,>4 q | \voiceOne
    \grace c16 bf8 bf16\( c bf8 e,\) |
    \oneVoice <f a,>4 q | \voiceOne
  }
  \oneVoice
  q4 q |
  q2\fermata
}

upper.coda_alto = \relative {
  e''8 4 8 |
  f4. r8 |
  af,8 4 <c bf g>8 |
  s2 |
  e8 4 8 |
  f4. r8 |
  \X 2 { a,8 4 bf8 | }
  a8 a4( bf8) |
  s2 |
  a8 4 f8 |
  s2 |
  e8 4 bf8 |
  s2 |
  a'8 4 ef!8 |
  s2 |
  e8 4 bf8 |
  s2 * 3 |
}

upper.coda = <<
  \barNumberCheck 35
  \new Voice = "soprano" {
    \voiceOne
    \upper.coda_soprano
  }
  \new Voice = "alto" {
    \voiceTwo
    \upper.coda_alto
  }
>>


lower.coda = \relative {
  \barNumberCheck 35
  \X 2 { bf,8 <bf' df> } |
  \X 2 { b, <b' d> } |
  c, <c' f> c, <c' e> |
  \X 2 { f, <c' f> } |
  \X 2 { bf, <bf' df> } |
  \X 2 { b, <b' d> } |
  \X 2 {
    c, <c' f> c, <c' e> |
  }
  c, <c' f> c, <c' g'> |
  \X 4 { f,, <c' f> } |
  \X 4 { f, <c' g'> } |
  \X 2 { f, <c' f> } |
  f, <c' f> f, <c' fs>^> |
  \X 2 { f, <c' g'> } |
  f, <c' g'> f, <df'! g>^> |
  \X 4 { f, <c' f> } |
  <f, c' f>2\fermata |
}

between.coda = {
  \barNumberCheck 35
  s4 s8\< s8\! |
  s8\> s8\! s4 |
  s2 * 2 |
  s4\ppp  s8\< s8\! |
  s8\> s8\! s4 |
  s8 s8-\markup\italic{ dim. } s4 |
  s2 * 3 |
  s8-\markup\italic{ dim. } s4. |
  s2 * 9 |
}


breaks_ref = {
  s2 * 6 | \break
  \barNumberCheck 7
  \grace s16
  s2 * 7 | \break
  \barNumberCheck 14
  s2 * 7 | \break
  \barNumberCheck 21
  s2 * 6 | \break
  \barNumberCheck 27
  \grace s16
  s2 * 7 | \break
  \barNumberCheck 34
  s2 * 6 | \break
  \barNumberCheck 40
  s2 * 7 | \break
  \barNumberCheck 47
  \grace s16
  s2 * 7 |
  \barNumberCheck 54
}

breaks = {
  s2 * 26 \pageBreak \grace s16
}

breaksx = {
  %% Intro = mm. 1-2
  %% A = mm. 3-10
  s2 * 10 \break
  %% B = mm. 11-18
  s2 * 8 \break
  %% C = mm. 19-26 (f)
  s2 * 4 \pageBreak
  s2 * 4 \break
  %% A′ = mm. 27-34 (pp)
  \grace s16 s2 * 8 \break
  %% Coda = mm. 35-54
  \grace s16 s2 * 20
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Score

\score {
  \new PianoStaff <<
    \new Staff = "up" {
      \global
      \upper.intro
      \repeat volta 2 {
        \upper.A
      }
      \repeat volta 2 {
        \upper.B
      }
      \repeat volta 2 {
        \upper.C
      }
      \upper.A′
      \upper.coda
      \bar "|."
    }
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    }{
      \global
      \between.intro
      \between.A
      \between.B
      \between.C
      \between.A′
      \between.coda
    }
    \new Staff = "down" {
      \global
      \lower.intro
      \lower.A
      \lower.B
      \lower.C
      \lower.A′
      \lower.coda
    }
    \new Dynamics {
      %\breaks_ref
      \breaks
    }
  >>
}
