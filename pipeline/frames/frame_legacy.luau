--!nolint
--!nocheck

-- LEGACY

--[[
    @link https://github.com/Proton-Utilities/Myriad
	
    @author Proton-Utilities
    @repository Myriad

    This file was automatically @generated with ProCMP, it is not intended for manual editing.
--]]

warn("Using a legacy route\n(Use <release>/myriad.luau instead of <release/pre.luau/release.luau etc)")

_P = {
    genDate = __COMPOSER.Insert(__COMPOSER.genDate),
    cfg = __COMPOSER.Insert(__COMPOSER.cfg),
    vers = __COMPOSER.Insert(__COMPOSER.vers)
}

__COMPOSER.Insert(__COMPOSER.build)