local simple = LoadV 'vanilla.v.routes.simple'
local restful = LoadV 'vanilla.v.routes.restful'

local Bootstrap = Class('application.bootstrap')

function Bootstrap:initWaf()
    LoadV('vanilla.sys.waf.acc'):check()
end

function Bootstrap:initErrorHandle()
    self.dispatcher:setErrorHandler({controller = 'error', action = 'error'})
end

function Bootstrap:initRoute()
    local router = self.dispatcher:getRouter()
    local restful_route = restful:new(self.dispatcher:getRequest())
    router:addRoute(restful_route, true)
end

function Bootstrap:initView()
    local view = LoadV('vanilla.v.views.lemplate'):new(self.dispatcher.application.config.view)
    self.dispatcher:setView(view)
end

function Bootstrap:initPlugin()
    local admin_plugin = LoadPlugin('plugins.admin'):new()
    self.dispatcher:registerPlugin(admin_plugin);
end

function Bootstrap:boot_list()
    return {
        -- Bootstrap.initWaf,
        -- Bootstrap.initErrorHandle,
        Bootstrap.initRoute,
        Bootstrap.initView,
        -- Bootstrap.initPlugin,
    }
end

function Bootstrap:__construct(dispatcher)
    self.dispatcher = dispatcher
end

return Bootstrap
