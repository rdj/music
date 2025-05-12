\version "2.24.0"
\language "english"
\pointAndClickOff

X = #(define-music-function (num music) (integer? ly:music?) #{ \repeat unfold $num $music #})
trip = #(define-music-function (music) (ly:music?) #{ \tuplet 3/2 #music #})
gr = #(define-music-function (music) (ly:music?) #{ \appoggiatura #music #})
ffz = #(make-dynamic-script "ffz")

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
  }
  \context {
    \PianoStaff
    \accidentalStyle piano
    printKeyCancellation = ##f
  }
}

global = {
  \tempo "Allegretto"
  \key bf \major
  \time 3/4
}

%% Overall structure
%% Allegretto |:A:| |:BA′:|  Trio |:C:|  Scherzo da capo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% A. Alegretto
%% mm. 1-16 (repeated)

upper.A = \relative {
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
  \partial 4
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
%% B. mm. 16.3-36.2 (fermata rest)

upper.B = \relative {
  \barNumberCheck 16
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
  %% TODO - try to get it to draw this clef change differently, after
  %% the repeat bar and after the line break, so that there's a bass
  %% clef at the beginning of the line and then an explicit clef
  %% change so it's not see easy to miss when reading.
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

between.B = \relative {
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
%% breaks_ref to match NE

breaks_ref = {
  \partial 4
  s4 |
  s2. * 5 | \break
  \barNumberCheck 6
  s2. * 5 | \break
  \barNumberCheck 11
  s2. * 5 | s2 \pageBreak
  \barNumberCheck 16 %beat 3
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Score

\score {
  \new PianoStaff <<
    \new Staff = "up" {
      \global
      \repeat volta 2 { \upper.A }
      \upper.B
      %\bar "|."
    }
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    }{
      \global
      \between.A
      \between.B
    }
    \new Staff = "down" {
      \global
      \lower.A
      \lower.B
    }
    \new Dynamics {
      \global
      \breaks_ref
    }
  >>
}
