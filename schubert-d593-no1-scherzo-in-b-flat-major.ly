\version "2.24.0"
\language "english"
\pointAndClickOff

X = #(define-music-function (num music) (integer? ly:music?) #{ \repeat unfold $num $music #})
trip = #(define-music-function (music) (ly:music?) #{ \tuplet 3/2 #music #})
gr = #(define-music-function (music) (ly:music?) #{ \appoggiatura #music #})
ffz = #(make-dynamic-script "ffz")
turnNatural = \markup { \hspace #0.60 \column { \center-align \line { \musicglyph #"scripts.turn" } \line { \raise #1.75 \fontsize #-3 \natural } } }
turnSharp = \markup { \hspace #0.60 \column { \center-align \line { \musicglyph #"scripts.turn" } \line { \raise #1.75 \fontsize #-3 \sharp } } }

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
  % page-breaking = #ly:one-page-breaking
  % markup-system-spacing = #0
  % top-margin = #4
  % bottom-margin = #4
}

\header {
  title = "Scherzo in B-flat major"
  subsubtitle = \markup { "No. 1 from" \italic "Zwei Scherzi für Klavier" "(1871)" }
  composer = "Franz Schubert"
  opus = "D. 593, No. 1 (1817)"
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
%% Schubert - Scherzo in B-flat major, D. 593, No. 1
%%
%%   Allegretto: |:A:| |:BA′:|
%%   Trio: C |:D:|
%%   Scherzo Da Capo


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Allegretto
%% |:A:| |:BA′:|

global_allegretto = {
  \tempo "Allegretto"
  \key bf \major
  \time 3/4
  \partial 4
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% A = mm. 0.3 - 16.2 (repeat)

upper.A = \relative {
  \clef treble
  \trip { f''8\( f, d'\) } |
  bf8-.( r bf-.) r \trip { f'\( f, d'\) } |
  bf8-.( r bf-.) r \gr g'16 f8-. e-. |
  \gr g16 f8-. e-. f-. g-. a-. bf-. |
  fs4->( g8) r \trip { g\( c, ef\) } |
  a,-.( r a-.) r \trip { gf'\( c, ef\) } |
  a,-.( r a-.) r \gr d'16 c8-. b-. |
  \gr d16 c8-. b-. c-. d-. ef-. f-. |
  cs4->( d8) r \trip { f,\( f, d'\) } |
  bf8-.( r bf-.) r \trip { f'\( f, d'\) } |
  bf8-.( r bf-.) r \gr c16 bf8-. a-. |
  bf-. c-. <d bf'>-. <ef bf'>-. <e bf'>-. <f bf> |
  <fs_( bf~>4 <g) bf>8 r \trip { g\( c, ef\) } |
  a,-. r <f' f'>4 q |
  q\(~ \trip { f'8 d bf } \trip { f d bf\) } |
  <<
    { a16( c) r8 af16( d) r8 g,16( c) r8 }
    \\
    { f,8 s f s e s }
  >>
  f8 r r4
}

lower.A = \relative {
  \clef bass
  r4 |
  \X 3 {
    bf,8 r <f' bf d> r r4 |
  }
  ef,8 r <g' bf ef> r r4 |
  \X 2 {
    f8 r <c' ef f> r r4 |
  }
  f,8 r <a ef' f> r r4 |
  bf,8 r <bf' d f> r r4 |
  \X 3 {
    bf,8 r <af' bf d> r r4 |
  }
  ef,8 r <g' bf ef> r r4 |
  r4 <ef f a c> q |
  <d f bf>2 r4 |
  <c c'>8 r <b b'> r <bf bf'> r |
  <f' a>8 r f, r
}

between.A = {
  s4\p |
  s2. * 7 |
  s2 s4\pp |
  s2. * 2 |
  s4 s8\< s8 s8 s8\! |
  s4\> s8\! s8 s4 |
  s4 s4\ff s4 |
  s8\> s8\! s2 |
  s4\p s2 | s2
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% B = mm. 16.3-36.2 (fermata rest)

upper.B = \relative {
  \barNumberCheck 16
  \grace s64
  \trip { f'''8\( f, bf\) } |
  \X 2 {
    a r a r \trip { f'8\( f, bf\) } |
  }
  <<
    { g\( b c d ef c\) }
    \\
    g2.
  >> |
  <f_~ bf(>4 <f a)>8 r \trip { f\( f, bf\) } |
  <gf gf'> r q r \trip { ef'\( gf, af\) } |
  <f f'> r q r <af df> r |
  <bf ef> r q r << \trip { c\( af c\) } \\ { gf8 r } >> |
  <df' f,>8 r q r \trip { af'\( af, df\) } |
  <c gf>8 r q  r \trip { gf'\( ef c\) } |
  <df f,>8 r q r \trip { af\( af, df\) } |
  <c gf>8 r q r \trip { gf'\( ef c\) } |
  <df f,>8 r q r \trip { f'\( f, df' } |
  \X 3 { \trip { f f, df' } } |
  \X 2 { \trip { f f, d' } } \trip { f f, d'\) } |
  \X 3 { \trip { g g, d' } } |
  \trip { g-. g, c } \trip { ef-. ef, g } \trip { c-. c, ef } |
  \voiceOne
  \trip { g-.
  \change Staff = "down"
  g, c } \trip { ef-. ef, g } \trip { c-. c, ef } |
  <gf ef c>4-. q-. s |
  <f ef c>-. q-. s |
  \change Staff = "up"
  \oneVoice
  r r\fermata
}

lower.B = \relative {
  \barNumberCheck 16
  \once \hideNotes \grace c64
  \once \override Staff.Clef.X-extent = #'(1.5 . 2)
  %\once\override Staff.Clef.extra-spacing-width = #'(0 . 0)
  \clef treble
  d''8 r |
  \X 2 {
    <ef f>2-> d8 r |
  }
  ef2 <c ef,>4 |
  <d^( f,~>4 <c) f,>8 r
  \clef bass
  df,4 |
  ef4~\( \trip { ef8 ef, gf\) } <af c>4 |
  <df df,>2 \trip { f,8\( df f\) } |
  gf4~\( \trip { gf8 ef gf\) } <af ef'> r |
  <df df,> r q r r4 |
  <af ef'>8 r q r r4 |
  <df, df'>8 r q r r4 |
  <af ef'>8 r q r r4 |
  <df df,>8 r q r r4 |
  R2. |
  R2. |
  <f g_~ b(>2.-> |
  <ef g c)>4 r r |
  \voiceTwo R2. |
  <a, a,>4-. q-. \once \oneVoice r |
  q-. q-. \oneVoice r |
  r r\fermata
}

between.B = {
  \barNumberCheck 16
  s4\p |
  s4\fp s2 |
  s4\fp s2 |
  s8\< s8 s8\! s8\> s8 s8\! |
  s2 s4\pp |
  s2. * 7 |
  s2 s4\p |
  s2. * 2 |
  s4\ffz s2 |
  s2. * 2 |
  s4\p s2 |
  s4\pp s2 |
  s2
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% A′ = mm. 36.3 - 50.2 (repeat to B)

upper.A′ = \relative {
  \clef treble
  \partial 4
  \trip { f''8\( f, d'\) } |
  bf8-.( r bf-.) r \trip { f'\( f, d'\) } |
  bf8-.( r bf-.) r \gr g'16 f8-. e-. |
  \gr g16 f8-. e-. f-. g-. a-. bf-. |
  fs4->( g8) r \trip { g\( c, ef\) } |
  a,-.( r a-.) r \trip { gf'\( c, ef\) } |
  a,-.( r a-.) r \gr d'16 c8-. b-. |
  \gr d16 c8-. b-. c-. d-. ef-. f-. |
  cs4->( d8) r \trip { f,\( f, d'\) } |
  bf8-.( r bf-.) r \trip { f'\( f, d'\) } |
  bf8-.( r bf-.) r r4 |
  r <bf d f bf>-. q-. |
  <bf ef bf'~>\( \trip { bf'8 g ef } \trip { bf g ef\) } |
  <<
    { d16( f) r8 df16( g) r8 c,16( f) r8 }
    \\
    { bf,8 s bf s a s }
  >> |
  bf8 r r4
}

lower.A′ = \relative {
  \clef bass
  \partial 4
  r4 |
  \X 3 {
    bf,8 r <f' bf d> r r4 |
  }
  ef,8 r <g' bf ef> r r4 |
  \X 2 {
    f8 r <c' ef f> r r4 |
  }
  f,8 r <a ef' f> r r4 |
  bf,8 r <bf' d f> r r4 |
  bf,8 r <af' bf d> r r4 |
  bf,8 r <af' bf d> r \trip { bf\( d, f\) } |
  af, r <af d f af>4-. q-. |
  <g ef' g>2 r4 |
  <f f'>8 r <f e'> r <f ef'> r |
  <bf d> r bf, r
}

between.A′ = {
  \partial 4
  s4\p |
  s2. * 7 |
  s2 s4\pp |
  s2. |
  s2 s4\f |
  s4 s2\ff |
  s8\> s8\! s2 |
  s4\p s2 |
  s2
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Trio C |:D:|

global_trio = {
  \set Staff.explicitKeySignatureVisibility = #begin-of-line-visible
  \once \override Staff.TimeSignature.break-visibility = #begin-of-line-visible

  \mark "Trio"
  \key ef \major
  \barNumberCheck 50
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% C = mm. 50.3 - 66.2

upper.C_soprano = \relative {
  \once \oneVoice bf4^\turnNatural |
  <ef g,>2->^\markup { \italic legato }\( d8 c | <bf af>2 c8 d\) |
  \oneVoice
  ef4_\( fs8. g16 c8.-> bf16\) |
  <f d>4 r bf,4^\turnNatural |
  \voiceOne
  <ef g,>2->\( d8 c | <bf af>2 c8 d\) |
  \after 4*2/3 \turn ef4\( g8 f ef d\)
  <ef g,>4 \oneVoice r bf'4^\turnNatural |
  \voiceOne
  ef2->\( d8 c | <bf af>2 c8 d\) |
  \oneVoice
  ef4\( fs8. g16 c8.-> bf16\) |
  <f d>4 r bf,4^\turnNatural |
  \voiceOne
  <ef g,>2->\( d8 c | <bf af>2 c8 d\) |
  \after 4*2/3 \turn ef4\( g8 f ef d\)
  ef4 \oneVoice r
}

upper.C_alto = \relative {
  s4 |
  g2. |
  s2. * 3 |
  g2. |
  s2. |
  bf4\( c af\) |
  s2. |
  << g'2. \\ { g2 ef4 } >> |
  d2 s4 |
  s2. * 2 |
  << g2. \\ { g2 ef4 } >> |
  d2 s4 |
  bf'\( c af\) |
  g s
}

upper.C = <<
  \clef treble
  \new Voice = "soprano" {
    \voiceOne
    \upper.C_soprano
  }
  \new Voice = "alto" {
    \voiceTwo
    \upper.C_alto
  }
>>

%% Note that there is some crazy notation going on here in the left
%% hand, I think Schubert is trying to really notate some finger
%% pedaling or something. There are a lot of overlapping notes that
%% I'm having trouble ascribing to specific independent voices.
lower.C_tenor = \relative {
  s4 |
  r << bf,2-> \\ {} \\ { s4 ef } >> |
  << { r4 bf2-> } \\ {} \\ { d2 s4 } >> |
  r4 bf2-> |
  bf,4( bf') s |
  r << bf2-> \\ {} \\ { s4 ef } >> |
  << { r4 bf2-> } \\ {} \\ { d2 s4 } >> |
  s2. * 2 |
  \X 3 { r4 bf'2-> | }
  bf,4( bf') s |
  \X 2 { r4 bf2-> | }
  s2. |
  s2
}

lower.C_bass = \relative {
  \once \oneVoice r4 |
  ef,2.( |
  f2.) |
  g2( ef4) |
  bf2
  \once \oneVoice r4 |
  ef2.( |
  f2.) |
  \oneVoice
  g4-. af-. bf-. |
  ef,-. ef'-. r |
  \voiceTwo
  ef2.( |
  f2.) |
  g2( ef4) |
  bf2 \once \oneVoice r4 |
  ef2.( |
  f2.) |
  \oneVoice
  g4-. af-. bf-. |
  ef, r
}

lower.C = <<
  \clef bass
  \new Voice = "soprano" {
    \voiceOne
    \lower.C_tenor
  }
  \new Voice = "alto" {
    \voiceTwo
    \lower.C_bass
  }
>>

between.C = {
  s4\p |
  s2. * 15 |
  s2
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% D = mm. 66.3 - 80.2 (repeat)

upper.D_soprano = \relative {
  g4^\turnSharp |
  <g' ef>2\( <ef c>8 <d bf>\) |
  <c a>2\( <d bf>8 <ef c>\) |
  <f d>2\( <d bf>8 <c a>\) |
  <bf g>4. d8\( ef f |
  g f ef4
  \change Staff = "down"
  <c a ef>4\) |
  <bf d,>8\( a c bf a af\) |
  \change Staff = "up"
  <ef' g,>2->\( d8 c |
  <bf af>2 c8 d\) |
  ef4_\( fs8. g16 c8.-> bf16\) |
  <f d>4 \oneVoice r bf^\turnNatural |
  \voiceOne
  ef2->\( d8 c | <bf af>2 c8 d\) |
  \after 4*2/3 \turn ef4\( g8 f ef d\) |
  ef4 \once \oneVoice r
}

upper.D_alto = \relative {
  s4 |
  s2. * 3 |
  s4. bf4. |
  bf8 b c4 s |
  s2. |
  g2. |
  s2. * 3 |
  << g'2. \\ { g2 ef4 } >> |
  d2 s4 |
  bf'4\( c af\) |
  g4 s
}

upper.D = <<
  \new Voice = "soprano" {
    \voiceOne
    \upper.D_soprano
  }
  \new Voice = "alto" {
    \voiceTwo
    \upper.D_alto
  }
>>

lower.D_tenor = \relative {
  s4 |
  s2. * 6 |
  r4 << bf,2-> \\ {} \\ { s4 ef } >> |
  << { r4 bf2-> } \\ {} \\ { d2 s4 } >> |
  r4 bf2-> |
  bf,4( bf') s |
  \X 2 { r4 bf'2-> } |
  s2. |
  s2
}

lower.D_bass = \relative {
  \oneVoice
  r4 |
  c,8\( b c d ef e |
  f e f g f ef\) |
  d\( bf d ef f fs |
  g fs g af g d\) |
  \voiceTwo
  ef\( d c ef f f,\) |
  bf4 r r |
  ef2.( | f2.) |
  g2( ef4) |
  bf2 \once \oneVoice r4 |
  ef'2.( | f) |
  \oneVoice
  g4-. af-. bf-. |
  ef, r_\markup { \translate #'(-10 . 0) \small \italic "Scherzo Da Capo" }
}

lower.D = <<
  \new Voice = "soprano" {
    \voiceOne
    \lower.D_tenor
  }
  \new Voice = "alto" {
    \voiceTwo
    \lower.D_bass
  }
>>

between.D = {
  s4 |
  s4\pp s2 |
  s2. * 2 |
  s4. s8\> s8 s8\! |
  s2. * 2 |
  s4\p s2 |
  s2. * 6 |
  s2
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% breaks_ref to match Henle At the Piano

breaks_ref_allegretto = {
  s4 |
  s2. * 5 | \break
  \barNumberCheck 6
  s2. * 5 | \break
  \barNumberCheck 11
  s2. * 5 | s2 \pageBreak
  \barNumberCheck 16 %beat 3
  \grace { s64 }
  s4 | s2. * 4 | \break
  \barNumberCheck 21
  s2. * 5 | \break
  \barNumberCheck 26
  s2. * 5 | \break
  \barNumberCheck 31
  s2. * 5 | \break
  \barNumberCheck 36
  s2. * 5 | \break
  \barNumberCheck 41
  s2. * 5 | \pageBreak
  \barNumberCheck 46
  s2. * 4 | s2 \break
}

breaks_ref_trio = {
  \barNumberCheck 50 %beat 3
  s4 | s2. * 5 | \break
  \barNumberCheck 56
  s2. * 6 | \break
  \barNumberCheck 62
  s2. * 6 | \break
  \barNumberCheck 68
  s2. * 6 | \break
  \barNumberCheck 74
  s2. * 6 | s2 % end
  \barNumberCheck 80
}

breaks = {
  s4 |
  s2. * 15 |
  s2 \break \grace s64 s4 |
  s2. * 33 |
  s2 \pageBreak s4 |
  s2. * 6 \break |
  s2. * 6 \break |
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Score

\score {
  \new PianoStaff <<
    \new Staff = "up" {
      \global_allegretto
      \repeat volta 2 {
        \upper.A
      }
      \repeat volta 2 {
        \upper.B
        \upper.A′
      }

      \global_trio
      \upper.C
      \repeat volta 2 {
        \upper.D
      }
    }
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    }{
      \global_allegretto
      \between.A
      \between.B
      \between.A′

      \global_trio
      \between.C
      \between.D
    }
    \new Staff = "down" {
      \global_allegretto
      \lower.A
      \lower.B
      \lower.A′

      \global_trio
      \lower.C
      \lower.D
    }
    \new Dynamics {
      \breaks
      % \global_allegretto
      % \breaks_ref_allegretto

      % \global_trio
      % \breaks_ref_trio
    }
  >>
}
