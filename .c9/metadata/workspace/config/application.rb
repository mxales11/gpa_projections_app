{"changed":true,"filter":false,"title":"application.rb","tooltip":"/config/application.rb","value":"require File.expand_path('../boot', __FILE__)\n\nrequire 'rails/all'\n\n\nBundler.require(*Rails.groups(:assets => %w(development test)))\n\n\nmodule GpaProjectionsApp\n  class Application < Rails::Application\n      config.active_record.raise_in_transactional_callbacks = true\n      config.serve_static_assets = true\n  end\nend\n","undoManager":{"mark":1,"position":9,"stack":[[{"group":"doc","deltas":[{"start":{"row":10,"column":66},"end":{"row":11,"column":0},"action":"insert","lines":["",""]},{"start":{"row":11,"column":0},"end":{"row":11,"column":6},"action":"insert","lines":["      "]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":6},"end":{"row":11,"column":39},"action":"insert","lines":["config.serve_static_assets = true"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":39},"end":{"row":11,"column":40},"action":"insert","lines":["g"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":40},"end":{"row":11,"column":41},"action":"insert","lines":["i"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":41},"end":{"row":11,"column":42},"action":"insert","lines":["t"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":42},"end":{"row":11,"column":43},"action":"insert","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":42},"end":{"row":11,"column":43},"action":"remove","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":41},"end":{"row":11,"column":42},"action":"remove","lines":["t"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":40},"end":{"row":11,"column":41},"action":"remove","lines":["i"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":39},"end":{"row":11,"column":40},"action":"remove","lines":["g"]}]}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":11,"column":39},"end":{"row":11,"column":39},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1430153304694}