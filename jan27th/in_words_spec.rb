




<!DOCTYPE html>
<html>
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# object: http://ogp.me/ns/object# article: http://ogp.me/ns/article# profile: http://ogp.me/ns/profile#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>learn_ruby/15_in_words/in_words_spec.rb at master · alexch/learn_ruby</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub" />
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub" />
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-114.png" />
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114.png" />
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-144.png" />
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144.png" />
    <meta property="fb:app_id" content="1401488693436528"/>
    <meta content="@github" name="twitter:site" /><meta content="summary" name="twitter:card" /><meta content="alexch/learn_ruby" name="twitter:title" /><meta content="learn_ruby - a basic ruby class generated from test-first-teaching" name="twitter:description" /><meta content="https://0.gravatar.com/avatar/5a0d7f0cb2fac7858d234de7f7f01491?d=https%3A%2F%2Fidenticons.github.com%2Fa29a5ba2cb7bdeabba22de8c83321b46.png&amp;r=x&amp;s=400" name="twitter:image:src" />
<meta content="GitHub" property="og:site_name" /><meta content="object" property="og:type" /><meta content="https://0.gravatar.com/avatar/5a0d7f0cb2fac7858d234de7f7f01491?d=https%3A%2F%2Fidenticons.github.com%2Fa29a5ba2cb7bdeabba22de8c83321b46.png&amp;r=x&amp;s=400" property="og:image" /><meta content="alexch/learn_ruby" property="og:title" /><meta content="https://github.com/alexch/learn_ruby" property="og:url" /><meta content="learn_ruby - a basic ruby class generated from test-first-teaching" property="og:description" />

    <meta name="hostname" content="github-fe119-cp1-prd.iad.github.net">
    <meta name="ruby" content="ruby 2.1.0p0-github-tcmalloc (60139581e1) [x86_64-linux]">
    <link rel="assets" href="https://github.global.ssl.fastly.net/">
    <link rel="conduit-xhr" href="https://ghconduit.com:25035/">
    <link rel="xhr-socket" href="/_sockets" />
    


    <meta name="msapplication-TileImage" content="/windows-tile.png" />
    <meta name="msapplication-TileColor" content="#ffffff" />
    <meta name="selected-link" value="repo_source" data-pjax-transient />
    <meta content="collector.githubapp.com" name="octolytics-host" /><meta content="collector-cdn.github.com" name="octolytics-script-host" /><meta content="github" name="octolytics-app-id" /><meta content="C7F1C8D5:6648:73C13A7:52E6DAF0" name="octolytics-dimension-request_id" /><meta content="2740738" name="octolytics-actor-id" /><meta content="fenmarel" name="octolytics-actor-login" /><meta content="55ca868134401eeb44e68c33ed1db46fdce99cafd82b541349ab7c991aad22f2" name="octolytics-actor-hash" />
    

    
    
    <link rel="icon" type="image/x-icon" href="/favicon.ico" />

    <meta content="authenticity_token" name="csrf-param" />
<meta content="qow+BGd/jVrbFlXq7mEK+/npunUtf5A110VI6F7Q5P8=" name="csrf-token" />

    <link href="https://github.global.ssl.fastly.net/assets/github-12584d859a69c9f66deca12aa0588ba3a516727c.css" media="all" rel="stylesheet" type="text/css" />
    <link href="https://github.global.ssl.fastly.net/assets/github2-86050ea70e9ba43d385d71b8b90a231860f6c086.css" media="all" rel="stylesheet" type="text/css" />
    


      <script src="https://github.global.ssl.fastly.net/assets/frameworks-2086b76396d7018acf390457357b14121f3e16f3.js" type="text/javascript"></script>
      <script async="async" defer="defer" src="https://github.global.ssl.fastly.net/assets/github-623e1b19c2d602365ac35e11d575fe153f82e21d.js" type="text/javascript"></script>
      
      <meta http-equiv="x-pjax-version" content="b9fb693c938d02d6391109f15f6a0779">

        <link data-pjax-transient rel='permalink' href='/alexch/learn_ruby/blob/7b545d709d850b896980b422e028265c4dbc134f/15_in_words/in_words_spec.rb'>

  <meta name="description" content="learn_ruby - a basic ruby class generated from test-first-teaching" />

  <meta content="8524" name="octolytics-dimension-user_id" /><meta content="alexch" name="octolytics-dimension-user_login" /><meta content="1053062" name="octolytics-dimension-repository_id" /><meta content="alexch/learn_ruby" name="octolytics-dimension-repository_nwo" /><meta content="true" name="octolytics-dimension-repository_public" /><meta content="false" name="octolytics-dimension-repository_is_fork" /><meta content="1053062" name="octolytics-dimension-repository_network_root_id" /><meta content="alexch/learn_ruby" name="octolytics-dimension-repository_network_root_nwo" />
  <link href="https://github.com/alexch/learn_ruby/commits/master.atom" rel="alternate" title="Recent Commits to learn_ruby:master" type="application/atom+xml" />

  </head>


  <body class="logged_in  env-production macintosh vis-public page-blob">
    <div class="wrapper">
      
      
      
      


      <div class="header header-logged-in true">
  <div class="container clearfix">

    <a class="header-logo-invertocat" href="https://github.com/">
  <span class="mega-octicon octicon-mark-github"></span>
</a>

    
    <a href="/notifications" class="notification-indicator tooltipped downwards" data-gotokey="n" title="You have no unread notifications">
        <span class="mail-status all-read"></span>
</a>

      <div class="command-bar js-command-bar  in-repository">
          <form accept-charset="UTF-8" action="/search" class="command-bar-form" id="top_search_form" method="get">

<input type="text" data-hotkey="/ s" name="q" id="js-command-bar-field" placeholder="Search or type a command" tabindex="1" autocapitalize="off"
    
    data-username="fenmarel"
      data-repo="alexch/learn_ruby"
      data-branch="master"
      data-sha="6472267fa33bd0b64991d094d94cd13caea3d116"
  >

    <input type="hidden" name="nwo" value="alexch/learn_ruby" />

    <div class="select-menu js-menu-container js-select-menu search-context-select-menu">
      <span class="minibutton select-menu-button js-menu-target">
        <span class="js-select-button">This repository</span>
      </span>

      <div class="select-menu-modal-holder js-menu-content js-navigation-container">
        <div class="select-menu-modal">

          <div class="select-menu-item js-navigation-item js-this-repository-navigation-item selected">
            <span class="select-menu-item-icon octicon octicon-check"></span>
            <input type="radio" class="js-search-this-repository" name="search_target" value="repository" checked="checked" />
            <div class="select-menu-item-text js-select-button-text">This repository</div>
          </div> <!-- /.select-menu-item -->

          <div class="select-menu-item js-navigation-item js-all-repositories-navigation-item">
            <span class="select-menu-item-icon octicon octicon-check"></span>
            <input type="radio" name="search_target" value="global" />
            <div class="select-menu-item-text js-select-button-text">All repositories</div>
          </div> <!-- /.select-menu-item -->

        </div>
      </div>
    </div>

  <span class="octicon help tooltipped downwards" title="Show command bar help">
    <span class="octicon octicon-question"></span>
  </span>


  <input type="hidden" name="ref" value="cmdform">

</form>
        <ul class="top-nav">
          <li class="explore"><a href="/explore">Explore</a></li>
            <li><a href="https://gist.github.com">Gist</a></li>
            <li><a href="/blog">Blog</a></li>
          <li><a href="https://help.github.com">Help</a></li>
        </ul>
      </div>

    


  <ul id="user-links">
    <li>
      <a href="/fenmarel" class="name">
        <img alt="Jonny P" height="20" src="https://0.gravatar.com/avatar/b181560aea7ff9dd9935f98e227b3d2d?d=https%3A%2F%2Fidenticons.github.com%2Fe9976e854c0110906b5365758a2054db.png&amp;r=x&amp;s=140" width="20" /> fenmarel
      </a>
    </li>

    <li class="new-menu dropdown-toggle js-menu-container">
      <a href="#" class="js-menu-target tooltipped downwards" title="Create new..." aria-label="Create new...">
        <span class="octicon octicon-plus"></span>
        <span class="dropdown-arrow"></span>
      </a>

      <div class="js-menu-content">
      </div>
    </li>

    <li>
      <a href="/settings/profile" id="account_settings"
        class="tooltipped downwards"
        aria-label="Account settings "
        title="Account settings ">
        <span class="octicon octicon-tools"></span>
      </a>
    </li>
    <li>
      <a class="tooltipped downwards" href="/logout" data-method="post" id="logout" title="Sign out" aria-label="Sign out">
        <span class="octicon octicon-log-out"></span>
      </a>
    </li>

  </ul>

<div class="js-new-dropdown-contents hidden">
  

<ul class="dropdown-menu">
  <li>
    <a href="/new"><span class="octicon octicon-repo-create"></span> New repository</a>
  </li>
  <li>
    <a href="/organizations/new"><span class="octicon octicon-organization"></span> New organization</a>
  </li>



    <li class="section-title">
      <span title="alexch/learn_ruby">This repository</span>
    </li>
      <li>
        <a href="/alexch/learn_ruby/issues/new"><span class="octicon octicon-issue-opened"></span> New issue</a>
      </li>
</ul>

</div>


    
  </div>
</div>

      

      




          <div class="site" itemscope itemtype="http://schema.org/WebPage">
    
    <div class="pagehead repohead instapaper_ignore readability-menu">
      <div class="container">
        

<ul class="pagehead-actions">

    <li class="subscription">
      <form accept-charset="UTF-8" action="/notifications/subscribe" class="js-social-container" data-autosubmit="true" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="authenticity_token" type="hidden" value="qow+BGd/jVrbFlXq7mEK+/npunUtf5A110VI6F7Q5P8=" /></div>  <input id="repository_id" name="repository_id" type="hidden" value="1053062" />

    <div class="select-menu js-menu-container js-select-menu">
      <a class="social-count js-social-count" href="/alexch/learn_ruby/watchers">
        8
      </a>
      <span class="minibutton select-menu-button with-count js-menu-target" role="button" tabindex="0">
        <span class="js-select-button">
          <span class="octicon octicon-eye-watch"></span>
          Watch
        </span>
      </span>

      <div class="select-menu-modal-holder">
        <div class="select-menu-modal subscription-menu-modal js-menu-content">
          <div class="select-menu-header">
            <span class="select-menu-title">Notification status</span>
            <span class="octicon octicon-remove-close js-menu-close"></span>
          </div> <!-- /.select-menu-header -->

          <div class="select-menu-list js-navigation-container" role="menu">

            <div class="select-menu-item js-navigation-item selected" role="menuitem" tabindex="0">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <div class="select-menu-item-text">
                <input checked="checked" id="do_included" name="do" type="radio" value="included" />
                <h4>Not watching</h4>
                <span class="description">You only receive notifications for conversations in which you participate or are @mentioned.</span>
                <span class="js-select-button-text hidden-select-button-text">
                  <span class="octicon octicon-eye-watch"></span>
                  Watch
                </span>
              </div>
            </div> <!-- /.select-menu-item -->

            <div class="select-menu-item js-navigation-item " role="menuitem" tabindex="0">
              <span class="select-menu-item-icon octicon octicon octicon-check"></span>
              <div class="select-menu-item-text">
                <input id="do_subscribed" name="do" type="radio" value="subscribed" />
                <h4>Watching</h4>
                <span class="description">You receive notifications for all conversations in this repository.</span>
                <span class="js-select-button-text hidden-select-button-text">
                  <span class="octicon octicon-eye-unwatch"></span>
                  Unwatch
                </span>
              </div>
            </div> <!-- /.select-menu-item -->

            <div class="select-menu-item js-navigation-item " role="menuitem" tabindex="0">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <div class="select-menu-item-text">
                <input id="do_ignore" name="do" type="radio" value="ignore" />
                <h4>Ignoring</h4>
                <span class="description">You do not receive any notifications for conversations in this repository.</span>
                <span class="js-select-button-text hidden-select-button-text">
                  <span class="octicon octicon-mute"></span>
                  Stop ignoring
                </span>
              </div>
            </div> <!-- /.select-menu-item -->

          </div> <!-- /.select-menu-list -->

        </div> <!-- /.select-menu-modal -->
      </div> <!-- /.select-menu-modal-holder -->
    </div> <!-- /.select-menu -->

</form>
    </li>

  <li>
  

  <div class="js-toggler-container js-social-container starring-container ">
    <a href="/alexch/learn_ruby/unstar"
      class="minibutton with-count js-toggler-target star-button starred upwards"
      title="Unstar this repository" data-remote="true" data-method="post" rel="nofollow">
      <span class="octicon octicon-star-delete"></span><span class="text">Unstar</span>
    </a>

    <a href="/alexch/learn_ruby/star"
      class="minibutton with-count js-toggler-target star-button unstarred upwards"
      title="Star this repository" data-remote="true" data-method="post" rel="nofollow">
      <span class="octicon octicon-star"></span><span class="text">Star</span>
    </a>

      <a class="social-count js-social-count" href="/alexch/learn_ruby/stargazers">
        71
      </a>
  </div>

  </li>


        <li>
          <a href="/alexch/learn_ruby/fork" class="minibutton with-count js-toggler-target fork-button lighter upwards" title="Fork this repo" rel="facebox nofollow">
            <span class="octicon octicon-git-branch-create"></span><span class="text">Fork</span>
          </a>
          <a href="/alexch/learn_ruby/network" class="social-count">222</a>
        </li>


</ul>

        <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="entry-title public">
          <span class="repo-label"><span>public</span></span>
          <span class="mega-octicon octicon-repo"></span>
          <span class="author">
            <a href="/alexch" class="url fn" itemprop="url" rel="author"><span itemprop="title">alexch</span></a>
          </span>
          <span class="repohead-name-divider">/</span>
          <strong><a href="/alexch/learn_ruby" class="js-current-repository js-repo-home-link">learn_ruby</a></strong>

          <span class="page-context-loader">
            <img alt="Octocat-spinner-32" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
          </span>

        </h1>
      </div><!-- /.container -->
    </div><!-- /.repohead -->

    <div class="container">
      

      <div class="repository-with-sidebar repo-container  ">

        <div class="repository-sidebar">
            

<div class="sunken-menu vertical-right repo-nav js-repo-nav js-repository-container-pjax js-octicon-loaders">
  <div class="sunken-menu-contents">
    <ul class="sunken-menu-group">
      <li class="tooltipped leftwards" title="Code">
        <a href="/alexch/learn_ruby" aria-label="Code" class="selected js-selected-navigation-item sunken-menu-item" data-gotokey="c" data-pjax="true" data-selected-links="repo_source repo_downloads repo_commits repo_tags repo_branches /alexch/learn_ruby">
          <span class="octicon octicon-code"></span> <span class="full-word">Code</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

        <li class="tooltipped leftwards" title="Issues">
          <a href="/alexch/learn_ruby/issues" aria-label="Issues" class="js-selected-navigation-item sunken-menu-item js-disable-pjax" data-gotokey="i" data-selected-links="repo_issues /alexch/learn_ruby/issues">
            <span class="octicon octicon-issue-opened"></span> <span class="full-word">Issues</span>
            <span class='counter'>5</span>
            <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>        </li>

      <li class="tooltipped leftwards" title="Pull Requests">
        <a href="/alexch/learn_ruby/pulls" aria-label="Pull Requests" class="js-selected-navigation-item sunken-menu-item js-disable-pjax" data-gotokey="p" data-selected-links="repo_pulls /alexch/learn_ruby/pulls">
            <span class="octicon octicon-git-pull-request"></span> <span class="full-word">Pull Requests</span>
            <span class='counter'>1</span>
            <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>


        <li class="tooltipped leftwards" title="Wiki">
          <a href="/alexch/learn_ruby/wiki" aria-label="Wiki" class="js-selected-navigation-item sunken-menu-item" data-pjax="true" data-selected-links="repo_wiki /alexch/learn_ruby/wiki">
            <span class="octicon octicon-book"></span> <span class="full-word">Wiki</span>
            <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>        </li>
    </ul>
    <div class="sunken-menu-separator"></div>
    <ul class="sunken-menu-group">

      <li class="tooltipped leftwards" title="Pulse">
        <a href="/alexch/learn_ruby/pulse" aria-label="Pulse" class="js-selected-navigation-item sunken-menu-item" data-pjax="true" data-selected-links="pulse /alexch/learn_ruby/pulse">
          <span class="octicon octicon-pulse"></span> <span class="full-word">Pulse</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

      <li class="tooltipped leftwards" title="Graphs">
        <a href="/alexch/learn_ruby/graphs" aria-label="Graphs" class="js-selected-navigation-item sunken-menu-item" data-pjax="true" data-selected-links="repo_graphs repo_contributors /alexch/learn_ruby/graphs">
          <span class="octicon octicon-graph"></span> <span class="full-word">Graphs</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

      <li class="tooltipped leftwards" title="Network">
        <a href="/alexch/learn_ruby/network" aria-label="Network" class="js-selected-navigation-item sunken-menu-item js-disable-pjax" data-selected-links="repo_network /alexch/learn_ruby/network">
          <span class="octicon octicon-git-branch"></span> <span class="full-word">Network</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>
    </ul>


  </div>
</div>

              <div class="only-with-full-nav">
                

  

<div class="clone-url open"
  data-protocol-type="http"
  data-url="/users/set_protocol?protocol_selector=http&amp;protocol_type=clone">
  <h3><strong>HTTPS</strong> clone URL</h3>
  <div class="clone-url-box">
    <input type="text" class="clone js-url-field"
           value="https://github.com/alexch/learn_ruby.git" readonly="readonly">

    <span class="js-zeroclipboard url-box-clippy minibutton zeroclipboard-button" data-clipboard-text="https://github.com/alexch/learn_ruby.git" data-copied-hint="copied!" title="copy to clipboard"><span class="octicon octicon-clippy"></span></span>
  </div>
</div>

  

<div class="clone-url "
  data-protocol-type="ssh"
  data-url="/users/set_protocol?protocol_selector=ssh&amp;protocol_type=clone">
  <h3><strong>SSH</strong> clone URL</h3>
  <div class="clone-url-box">
    <input type="text" class="clone js-url-field"
           value="git@github.com:alexch/learn_ruby.git" readonly="readonly">

    <span class="js-zeroclipboard url-box-clippy minibutton zeroclipboard-button" data-clipboard-text="git@github.com:alexch/learn_ruby.git" data-copied-hint="copied!" title="copy to clipboard"><span class="octicon octicon-clippy"></span></span>
  </div>
</div>

  

<div class="clone-url "
  data-protocol-type="subversion"
  data-url="/users/set_protocol?protocol_selector=subversion&amp;protocol_type=clone">
  <h3><strong>Subversion</strong> checkout URL</h3>
  <div class="clone-url-box">
    <input type="text" class="clone js-url-field"
           value="https://github.com/alexch/learn_ruby" readonly="readonly">

    <span class="js-zeroclipboard url-box-clippy minibutton zeroclipboard-button" data-clipboard-text="https://github.com/alexch/learn_ruby" data-copied-hint="copied!" title="copy to clipboard"><span class="octicon octicon-clippy"></span></span>
  </div>
</div>


<p class="clone-options">You can clone with
      <a href="#" class="js-clone-selector" data-protocol="http">HTTPS</a>,
      <a href="#" class="js-clone-selector" data-protocol="ssh">SSH</a>,
      or <a href="#" class="js-clone-selector" data-protocol="subversion">Subversion</a>.
  <span class="octicon help tooltipped upwards" title="Get help on which URL is right for you.">
    <a href="https://help.github.com/articles/which-remote-url-should-i-use">
    <span class="octicon octicon-question"></span>
    </a>
  </span>
</p>

  <a href="http://mac.github.com" data-url="github-mac://openRepo/https://github.com/alexch/learn_ruby" class="minibutton sidebar-button js-conduit-rewrite-url">
    <span class="octicon octicon-device-desktop"></span>
    Clone in Desktop
  </a>


                <a href="/alexch/learn_ruby/archive/master.zip"
                   class="minibutton sidebar-button"
                   title="Download this repository as a zip file"
                   rel="nofollow">
                  <span class="octicon octicon-cloud-download"></span>
                  Download ZIP
                </a>
              </div>
        </div><!-- /.repository-sidebar -->

        <div id="js-repo-pjax-container" class="repository-content context-loader-container" data-pjax-container>
          


<!-- blob contrib key: blob_contributors:v21:0043402ec698eb8e492d87fcbf3231af -->

<p title="This is a placeholder element" class="js-history-link-replace hidden"></p>

<a href="/alexch/learn_ruby/find/master" data-pjax data-hotkey="t" class="js-show-file-finder" style="display:none">Show File Finder</a>

<div class="file-navigation">
  

<div class="select-menu js-menu-container js-select-menu" >
  <span class="minibutton select-menu-button js-menu-target" data-hotkey="w"
    data-master-branch="master"
    data-ref="master"
    role="button" aria-label="Switch branches or tags" tabindex="0">
    <span class="octicon octicon-git-branch"></span>
    <i>branch:</i>
    <span class="js-select-button">master</span>
  </span>

  <div class="select-menu-modal-holder js-menu-content js-navigation-container" data-pjax>

    <div class="select-menu-modal">
      <div class="select-menu-header">
        <span class="select-menu-title">Switch branches/tags</span>
        <span class="octicon octicon-remove-close js-menu-close"></span>
      </div> <!-- /.select-menu-header -->

      <div class="select-menu-filters">
        <div class="select-menu-text-filter">
          <input type="text" aria-label="Filter branches/tags" id="context-commitish-filter-field" class="js-filterable-field js-navigation-enable" placeholder="Filter branches/tags">
        </div>
        <div class="select-menu-tabs">
          <ul>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="branches" class="js-select-menu-tab">Branches</a>
            </li>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="tags" class="js-select-menu-tab">Tags</a>
            </li>
          </ul>
        </div><!-- /.select-menu-tabs -->
      </div><!-- /.select-menu-filters -->

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="branches">

        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <div class="select-menu-item js-navigation-item selected">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/alexch/learn_ruby/blob/master/15_in_words/in_words_spec.rb"
                 data-name="master"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target"
                 title="master">master</a>
            </div> <!-- /.select-menu-item -->
        </div>

          <div class="select-menu-no-results">Nothing to show</div>
      </div> <!-- /.select-menu-list -->

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="tags">
        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


        </div>

        <div class="select-menu-no-results">Nothing to show</div>
      </div> <!-- /.select-menu-list -->

    </div> <!-- /.select-menu-modal -->
  </div> <!-- /.select-menu-modal-holder -->
</div> <!-- /.select-menu -->

  <div class="breadcrumb">
    <span class='repo-root js-repo-root'><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/alexch/learn_ruby" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">learn_ruby</span></a></span></span><span class="separator"> / </span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/alexch/learn_ruby/tree/master/15_in_words" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">15_in_words</span></a></span><span class="separator"> / </span><strong class="final-path">in_words_spec.rb</strong> <span class="js-zeroclipboard minibutton zeroclipboard-button" data-clipboard-text="15_in_words/in_words_spec.rb" data-copied-hint="copied!" title="copy to clipboard"><span class="octicon octicon-clippy"></span></span>
  </div>
</div>


  <div class="commit file-history-tease">
    <img class="main-avatar" height="24" src="https://0.gravatar.com/avatar/5a0d7f0cb2fac7858d234de7f7f01491?d=https%3A%2F%2Fidenticons.github.com%2Fa29a5ba2cb7bdeabba22de8c83321b46.png&amp;r=x&amp;s=140" width="24" />
    <span class="author"><a href="/alexch" rel="author">alexch</a></span>
    <time class="js-relative-date" datetime="2012-06-06T18:22:31-07:00" title="2012-06-06 18:22:31">June 06, 2012</time>
    <div class="commit-title">
        <a href="/alexch/learn_ruby/commit/5510c9956a698b79952396fd585ca7d578b32be9" class="message" data-pjax="true" title="generated">generated</a>
    </div>

    <div class="participation">
      <p class="quickstat"><a href="#blob_contributors_box" rel="facebox"><strong>1</strong> contributor</a></p>
      
    </div>
    <div id="blob_contributors_box" style="display:none">
      <h2 class="facebox-header">Users who have contributed to this file</h2>
      <ul class="facebox-user-list">
          <li class="facebox-user-list-item">
            <img height="24" src="https://0.gravatar.com/avatar/5a0d7f0cb2fac7858d234de7f7f01491?d=https%3A%2F%2Fidenticons.github.com%2Fa29a5ba2cb7bdeabba22de8c83321b46.png&amp;r=x&amp;s=140" width="24" />
            <a href="/alexch">alexch</a>
          </li>
      </ul>
    </div>
  </div>

<div id="files" class="bubble">
  <div class="file">
    <div class="meta">
      <div class="info">
        <span class="icon"><b class="octicon octicon-file-text"></b></span>
        <span class="mode" title="File Mode">file</span>
          <span>103 lines (89 sloc)</span>
        <span>3.125 kb</span>
      </div>
      <div class="actions">
        <div class="button-group">
            <a class="minibutton tooltipped leftwards js-conduit-openfile-check"
               href="http://mac.github.com"
               data-url="github-mac://openRepo/https://github.com/alexch/learn_ruby?branch=master&amp;filepath=15_in_words%2Fin_words_spec.rb"
               title="Open this file in GitHub for Mac"
               data-failed-title="Your version of GitHub for Mac is too old to open this file. Try checking for updates.">
                <span class="octicon octicon-device-desktop"></span> Open
            </a>
                <a class="minibutton tooltipped upwards"
                   title="Clicking this button will automatically fork this project so you can edit the file"
                   href="/alexch/learn_ruby/edit/master/15_in_words/in_words_spec.rb"
                   data-method="post" rel="nofollow">Edit</a>
          <a href="/alexch/learn_ruby/raw/master/15_in_words/in_words_spec.rb" class="button minibutton " id="raw-url">Raw</a>
            <a href="/alexch/learn_ruby/blame/master/15_in_words/in_words_spec.rb" class="button minibutton ">Blame</a>
          <a href="/alexch/learn_ruby/commits/master/15_in_words/in_words_spec.rb" class="button minibutton " rel="nofollow">History</a>
        </div><!-- /.button-group -->
          <a class="minibutton danger empty-icon tooltipped downwards"
             href="/alexch/learn_ruby/delete/master/15_in_words/in_words_spec.rb"
             title="Fork this project and delete file"
             data-method="post" data-test-id="delete-blob-file" rel="nofollow">
          Delete
        </a>
      </div><!-- /.actions -->
    </div>
        <div class="blob-wrapper data type-ruby js-blob-data">
        <table class="file-code file-diff">
          <tr class="file-code-line">
            <td class="blob-line-nums">
              <span id="L1" rel="#L1">1</span>
<span id="L2" rel="#L2">2</span>
<span id="L3" rel="#L3">3</span>
<span id="L4" rel="#L4">4</span>
<span id="L5" rel="#L5">5</span>
<span id="L6" rel="#L6">6</span>
<span id="L7" rel="#L7">7</span>
<span id="L8" rel="#L8">8</span>
<span id="L9" rel="#L9">9</span>
<span id="L10" rel="#L10">10</span>
<span id="L11" rel="#L11">11</span>
<span id="L12" rel="#L12">12</span>
<span id="L13" rel="#L13">13</span>
<span id="L14" rel="#L14">14</span>
<span id="L15" rel="#L15">15</span>
<span id="L16" rel="#L16">16</span>
<span id="L17" rel="#L17">17</span>
<span id="L18" rel="#L18">18</span>
<span id="L19" rel="#L19">19</span>
<span id="L20" rel="#L20">20</span>
<span id="L21" rel="#L21">21</span>
<span id="L22" rel="#L22">22</span>
<span id="L23" rel="#L23">23</span>
<span id="L24" rel="#L24">24</span>
<span id="L25" rel="#L25">25</span>
<span id="L26" rel="#L26">26</span>
<span id="L27" rel="#L27">27</span>
<span id="L28" rel="#L28">28</span>
<span id="L29" rel="#L29">29</span>
<span id="L30" rel="#L30">30</span>
<span id="L31" rel="#L31">31</span>
<span id="L32" rel="#L32">32</span>
<span id="L33" rel="#L33">33</span>
<span id="L34" rel="#L34">34</span>
<span id="L35" rel="#L35">35</span>
<span id="L36" rel="#L36">36</span>
<span id="L37" rel="#L37">37</span>
<span id="L38" rel="#L38">38</span>
<span id="L39" rel="#L39">39</span>
<span id="L40" rel="#L40">40</span>
<span id="L41" rel="#L41">41</span>
<span id="L42" rel="#L42">42</span>
<span id="L43" rel="#L43">43</span>
<span id="L44" rel="#L44">44</span>
<span id="L45" rel="#L45">45</span>
<span id="L46" rel="#L46">46</span>
<span id="L47" rel="#L47">47</span>
<span id="L48" rel="#L48">48</span>
<span id="L49" rel="#L49">49</span>
<span id="L50" rel="#L50">50</span>
<span id="L51" rel="#L51">51</span>
<span id="L52" rel="#L52">52</span>
<span id="L53" rel="#L53">53</span>
<span id="L54" rel="#L54">54</span>
<span id="L55" rel="#L55">55</span>
<span id="L56" rel="#L56">56</span>
<span id="L57" rel="#L57">57</span>
<span id="L58" rel="#L58">58</span>
<span id="L59" rel="#L59">59</span>
<span id="L60" rel="#L60">60</span>
<span id="L61" rel="#L61">61</span>
<span id="L62" rel="#L62">62</span>
<span id="L63" rel="#L63">63</span>
<span id="L64" rel="#L64">64</span>
<span id="L65" rel="#L65">65</span>
<span id="L66" rel="#L66">66</span>
<span id="L67" rel="#L67">67</span>
<span id="L68" rel="#L68">68</span>
<span id="L69" rel="#L69">69</span>
<span id="L70" rel="#L70">70</span>
<span id="L71" rel="#L71">71</span>
<span id="L72" rel="#L72">72</span>
<span id="L73" rel="#L73">73</span>
<span id="L74" rel="#L74">74</span>
<span id="L75" rel="#L75">75</span>
<span id="L76" rel="#L76">76</span>
<span id="L77" rel="#L77">77</span>
<span id="L78" rel="#L78">78</span>
<span id="L79" rel="#L79">79</span>
<span id="L80" rel="#L80">80</span>
<span id="L81" rel="#L81">81</span>
<span id="L82" rel="#L82">82</span>
<span id="L83" rel="#L83">83</span>
<span id="L84" rel="#L84">84</span>
<span id="L85" rel="#L85">85</span>
<span id="L86" rel="#L86">86</span>
<span id="L87" rel="#L87">87</span>
<span id="L88" rel="#L88">88</span>
<span id="L89" rel="#L89">89</span>
<span id="L90" rel="#L90">90</span>
<span id="L91" rel="#L91">91</span>
<span id="L92" rel="#L92">92</span>
<span id="L93" rel="#L93">93</span>
<span id="L94" rel="#L94">94</span>
<span id="L95" rel="#L95">95</span>
<span id="L96" rel="#L96">96</span>
<span id="L97" rel="#L97">97</span>
<span id="L98" rel="#L98">98</span>
<span id="L99" rel="#L99">99</span>
<span id="L100" rel="#L100">100</span>
<span id="L101" rel="#L101">101</span>
<span id="L102" rel="#L102">102</span>

            </td>
            <td class="blob-line-code">
                    <div class="code-body highlight"><pre><div class='line' id='LC1'><span class="c1"># # Topics</span></div><div class='line' id='LC2'><span class="c1">#</span></div><div class='line' id='LC3'><span class="c1"># * strings and numbers</span></div><div class='line' id='LC4'><span class="c1"># * modules</span></div><div class='line' id='LC5'><span class="c1"># * reopening classes</span></div><div class='line' id='LC6'><span class="c1">#</span></div><div class='line' id='LC7'><span class="c1"># # Extending a built-in class</span></div><div class='line' id='LC8'><span class="c1">#</span></div><div class='line' id='LC9'><span class="c1"># To make this test pass you&#39;ll need to extend a built-in class. You&#39;ll see that we&#39;re creating a new spec for &#39;Fixnum&#39; -- this isn&#39;t a new class you&#39;ll be building, but instead it is a built-in class you will extend.</span></div><div class='line' id='LC10'><span class="c1">#</span></div><div class='line' id='LC11'><span class="c1"># Remember that in Ruby, everything is an object, even a number.  Try this in irb:</span></div><div class='line' id='LC12'><span class="c1">#</span></div><div class='line' id='LC13'><span class="c1">#     &gt;&gt; 4.class</span></div><div class='line' id='LC14'><span class="c1">#     =&gt; Fixnum</span></div><div class='line' id='LC15'><span class="c1">#     &gt;&gt; 4.methods</span></div><div class='line' id='LC16'><span class="c1">#     \[&quot;inspect&quot;, &quot;%&quot;, &quot;&lt;&lt;&quot;, ...</span></div><div class='line' id='LC17'><span class="c1">#</span></div><div class='line' id='LC18'><span class="c1"># The number 4 is of class `FixNum` and it has methods on it.  Your challenge is to add an `in_words` method to `FixNum`.</span></div><div class='line' id='LC19'><span class="c1">#</span></div><div class='line' id='LC20'><br/></div><div class='line' id='LC21'><span class="nb">require</span> <span class="s2">&quot;in_words&quot;</span></div><div class='line' id='LC22'><br/></div><div class='line' id='LC23'><span class="n">describe</span> <span class="no">Fixnum</span> <span class="k">do</span></div><div class='line' id='LC24'><br/></div><div class='line' id='LC25'>&nbsp;&nbsp;<span class="n">it</span> <span class="s2">&quot;reads 0 to 9&quot;</span> <span class="k">do</span></div><div class='line' id='LC26'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">0</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;zero&#39;</span></div><div class='line' id='LC27'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">1</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;one&#39;</span></div><div class='line' id='LC28'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">2</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;two&#39;</span></div><div class='line' id='LC29'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">3</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;three&#39;</span></div><div class='line' id='LC30'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">4</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;four&#39;</span></div><div class='line' id='LC31'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">5</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;five&#39;</span></div><div class='line' id='LC32'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">6</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;six&#39;</span></div><div class='line' id='LC33'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">7</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;seven&#39;</span></div><div class='line' id='LC34'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">8</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;eight&#39;</span></div><div class='line' id='LC35'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">9</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;nine&#39;</span></div><div class='line' id='LC36'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC37'><br/></div><div class='line' id='LC38'>&nbsp;&nbsp;<span class="n">it</span> <span class="s2">&quot;reads 10 to 12&quot;</span> <span class="k">do</span></div><div class='line' id='LC39'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">10</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;ten&#39;</span></div><div class='line' id='LC40'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">11</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;eleven&#39;</span></div><div class='line' id='LC41'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">12</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;twelve&#39;</span></div><div class='line' id='LC42'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC43'><br/></div><div class='line' id='LC44'>&nbsp;&nbsp;<span class="n">it</span> <span class="s2">&quot;reads teens&quot;</span> <span class="k">do</span></div><div class='line' id='LC45'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">13</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;thirteen&#39;</span></div><div class='line' id='LC46'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">14</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;fourteen&#39;</span></div><div class='line' id='LC47'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">15</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;fifteen&#39;</span></div><div class='line' id='LC48'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">16</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;sixteen&#39;</span></div><div class='line' id='LC49'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">17</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;seventeen&#39;</span></div><div class='line' id='LC50'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">18</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;eighteen&#39;</span></div><div class='line' id='LC51'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">19</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;nineteen&#39;</span></div><div class='line' id='LC52'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC53'><br/></div><div class='line' id='LC54'>&nbsp;&nbsp;<span class="n">it</span> <span class="s2">&quot;reads tens&quot;</span> <span class="k">do</span></div><div class='line' id='LC55'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">20</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;twenty&#39;</span></div><div class='line' id='LC56'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">30</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;thirty&#39;</span></div><div class='line' id='LC57'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">40</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;forty&#39;</span></div><div class='line' id='LC58'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">50</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;fifty&#39;</span></div><div class='line' id='LC59'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">60</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;sixty&#39;</span></div><div class='line' id='LC60'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">70</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;seventy&#39;</span></div><div class='line' id='LC61'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">80</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;eighty&#39;</span></div><div class='line' id='LC62'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">90</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;ninety&#39;</span></div><div class='line' id='LC63'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC64'><br/></div><div class='line' id='LC65'>&nbsp;&nbsp;<span class="n">it</span> <span class="s2">&quot;reads various other numbers less than 100&quot;</span> <span class="k">do</span></div><div class='line' id='LC66'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">20</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;twenty&#39;</span></div><div class='line' id='LC67'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">77</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;seventy seven&#39;</span></div><div class='line' id='LC68'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">99</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;ninety nine&#39;</span></div><div class='line' id='LC69'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC70'><br/></div><div class='line' id='LC71'>&nbsp;&nbsp;<span class="n">it</span> <span class="s2">&quot;reads hundreds&quot;</span> <span class="k">do</span></div><div class='line' id='LC72'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">100</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;one hundred&#39;</span></div><div class='line' id='LC73'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">200</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;two hundred&#39;</span></div><div class='line' id='LC74'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">300</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;three hundred&#39;</span></div><div class='line' id='LC75'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">123</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;one hundred twenty three&#39;</span></div><div class='line' id='LC76'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">777</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;seven hundred seventy seven&#39;</span></div><div class='line' id='LC77'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">818</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;eight hundred eighteen&#39;</span></div><div class='line' id='LC78'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">512</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;five hundred twelve&#39;</span></div><div class='line' id='LC79'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">999</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;nine hundred ninety nine&#39;</span></div><div class='line' id='LC80'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC81'><br/></div><div class='line' id='LC82'>&nbsp;&nbsp;<span class="n">it</span> <span class="s2">&quot;reads thousands&quot;</span> <span class="k">do</span></div><div class='line' id='LC83'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">1000</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;one thousand&#39;</span></div><div class='line' id='LC84'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">32767</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;thirty two thousand seven hundred sixty seven&#39;</span></div><div class='line' id='LC85'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">32768</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;thirty two thousand seven hundred sixty eight&#39;</span></div><div class='line' id='LC86'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC87'><br/></div><div class='line' id='LC88'>&nbsp;&nbsp;<span class="n">it</span> <span class="s2">&quot;reads millions&quot;</span> <span class="k">do</span></div><div class='line' id='LC89'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">10_000_001</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;ten million one&#39;</span></div><div class='line' id='LC90'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC91'><br/></div><div class='line' id='LC92'>&nbsp;&nbsp;<span class="n">it</span> <span class="s2">&quot;reads billions&quot;</span> <span class="k">do</span></div><div class='line' id='LC93'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">1_234_567_890</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;one billion two hundred thirty four million five hundred sixty seven thousand eight hundred ninety&#39;</span></div><div class='line' id='LC94'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC95'><br/></div><div class='line' id='LC96'>&nbsp;&nbsp;<span class="n">it</span> <span class="s2">&quot;reads trillions&quot;</span> <span class="k">do</span></div><div class='line' id='LC97'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">1_000_000_000_000</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;one trillion&#39;</span></div><div class='line' id='LC98'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">1_000_000_000_001</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;one trillion one&#39;</span></div><div class='line' id='LC99'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">1_888_259_040_036</span><span class="o">.</span><span class="n">in_words</span><span class="o">.</span><span class="n">should</span> <span class="o">==</span> <span class="s1">&#39;one trillion eight hundred eighty eight billion two hundred fifty nine million forty thousand thirty six&#39;</span></div><div class='line' id='LC100'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC101'><br/></div><div class='line' id='LC102'><span class="k">end</span></div></pre></div>
            </td>
          </tr>
        </table>
  </div>

  </div>
</div>

<a href="#jump-to-line" rel="facebox[.linejump]" data-hotkey="l" class="js-jump-to-line" style="display:none">Jump to Line</a>
<div id="jump-to-line" style="display:none">
  <form accept-charset="UTF-8" class="js-jump-to-line-form">
    <input class="linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" autofocus>
    <button type="submit" class="button">Go</button>
  </form>
</div>

        </div>

      </div><!-- /.repo-container -->
      <div class="modal-backdrop"></div>
    </div><!-- /.container -->
  </div><!-- /.site -->


    </div><!-- /.wrapper -->

      <div class="container">
  <div class="site-footer">
    <ul class="site-footer-links right">
      <li><a href="https://status.github.com/">Status</a></li>
      <li><a href="http://developer.github.com">API</a></li>
      <li><a href="http://training.github.com">Training</a></li>
      <li><a href="http://shop.github.com">Shop</a></li>
      <li><a href="/blog">Blog</a></li>
      <li><a href="/about">About</a></li>

    </ul>

    <a href="/">
      <span class="mega-octicon octicon-mark-github" title="GitHub"></span>
    </a>

    <ul class="site-footer-links">
      <li>&copy; 2014 <span title="0.05788s from github-fe119-cp1-prd.iad.github.net">GitHub</span>, Inc.</li>
        <li><a href="/site/terms">Terms</a></li>
        <li><a href="/site/privacy">Privacy</a></li>
        <li><a href="/security">Security</a></li>
        <li><a href="/contact">Contact</a></li>
    </ul>
  </div><!-- /.site-footer -->
</div><!-- /.container -->


    <div class="fullscreen-overlay js-fullscreen-overlay" id="fullscreen_overlay">
  <div class="fullscreen-container js-fullscreen-container">
    <div class="textarea-wrap">
      <textarea name="fullscreen-contents" id="fullscreen-contents" class="js-fullscreen-contents" placeholder="" data-suggester="fullscreen_suggester"></textarea>
          <div class="suggester-container">
              <div class="suggester fullscreen-suggester js-navigation-container" id="fullscreen_suggester"
                 data-url="/alexch/learn_ruby/suggestions/commit">
              </div>
          </div>
    </div>
  </div>
  <div class="fullscreen-sidebar">
    <a href="#" class="exit-fullscreen js-exit-fullscreen tooltipped leftwards" title="Exit Zen Mode">
      <span class="mega-octicon octicon-screen-normal"></span>
    </a>
    <a href="#" class="theme-switcher js-theme-switcher tooltipped leftwards"
      title="Switch themes">
      <span class="octicon octicon-color-mode"></span>
    </a>
  </div>
</div>



    <div id="ajax-error-message" class="flash flash-error">
      <span class="octicon octicon-alert"></span>
      <a href="#" class="octicon octicon-remove-close close js-ajax-error-dismiss"></a>
      Something went wrong with that request. Please try again.
    </div>

  </body>
</html>

