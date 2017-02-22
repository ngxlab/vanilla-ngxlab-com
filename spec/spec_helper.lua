package.path = package.path .. ";/?.lua;/?/init.lua;/media/psf/g/idevz/code/www/vanilla/framework/0_1_0_rc7/?.lua;/media/psf/g/idevz/code/www/vanilla/framework/0_1_0_rc7/?/init.lua;;";
package.cpath = package.cpath .. ";/?.so;/media/psf/g/idevz/code/www/vanilla/framework/0_1_0_rc7/?.so;;";

Registry={}
Registry['APP_ROOT'] = '/media/psf/g/idevz/code/z/git/vanilla-ngxlab-com'
Registry['APP_NAME'] = 'vanilla-ngxlab-com'

LoadV = function ( ... )
    return require(...)
end

LoadApp = function ( ... )
    return require(Registry['APP_ROOT'] .. '/' .. ...)
end

LoadV 'vanilla.spec.runner'
