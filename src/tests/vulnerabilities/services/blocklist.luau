return {
	_pseudo = {
		DataModel = {
			Target = game,
			Methods = {
				"Load",
				"OpenScreenshotsFolder",
				"OpenVideosFolder",
			},
		},
	},

	Services = {
		ScriptContext = {
			"AddCoreScriptLocal",
			-- "SaveScriptProfilingData"
		},

		ScriptProfilerService = {
			"SaveScriptProfilingData",
		},

		MarketplaceService = {
			"GetRobuxBalance",
			"PerformPurchase",
			"PerformPurchaseV2",
			"PerformBulkPurchase",
			"PerformSubscriptionPurchase",
			"PerformSubscriptionPurchaseV2",
			"PerformCancelSubscription",
			"PromptPurchase",
			"PromptProductPurchase",
			"PromptGamePassPurchase",
			"PromptBundlePurchase",
			"PromptBulkPurchase",
			"PromptRobloxPurchase",
			"PromptThirdPartyPurchase",
			"PromptPremiumPurchase",
			"PromptSubscriptionPurchase",
			"PromptCancelSubscription",
			"PromptNativePurchase",
			"PromptNativePurchaseWithLocalPlayer",
			"PromptCollectiblesPurchase",
			"PrepareCollectiblesPurchase",
			"GetUserSubscriptionPaymentHistoryAsync",
			"GetUserSubscriptionDetailsInternalAsync",
			"GetUserSubscriptionStatusAsync",
		},

		Players = {
			"ReportAbuse",
			"ReportAbuseV3",
		},

		CoreGui = {
			"TakeScreenshot",
			"ToggleRecording",
		},

		SafetyService = {
			"TakeScreenshot",
		},

		BrowserService = {
			"OpenBrowserWindow",
			"OpenNativeOverlay",
			"ExecuteJavaScript",
			"ReturnToJavaScript",
			"SendCommand",
			"EmitHybridEvent",
			"OpenWeChatAuthWindow",
		},

		GuiService = {
			"OpenBrowserWindow",
			"OpenNativeOverlay",
			"BroadcastNotification",
			"SetPurchasePromptIsShown",
		},

		LinkingService = {
			"OpenUrl",
			"DetectUrl",
			"RegisterLuaUrl",
			"StartLuaUrlDelivery",
			"StopLuaUrlDelivery",
			"SwitchToSettingsApp",
			"SupportsSwitchToSettingsApp",
			"GetLastLuaUrl",
			"GetAndClearLastPendingUrl",
			"IsUrlRegistered",
		},

		HttpService = {
			"RequestInternal",
			"RequestAsync",
			"GetAsync",
			"PostAsync",
		},

		HttpRbxApiService = {
			"GetAsync",
			"GetAsyncFullUrl",
			"PostAsync",
			"PostAsyncFullUrl",
			"RequestAsync",
			"RequestLimitedAsync",
		},

		OpenCloudService = {
			"HttpRequestAsync",
			"GetApiV1",
			"InvokeAsync",
			"RegisterOpenCloud",
		},

		CaptureService = {
			"CaptureScreenshot",
			"CreatePostAsync",
			"DeleteCapture",
			"DeleteCapturesAsync",
			"GetCaptureFilePathAsync",
			"GetCaptureUploadDataAsync",
			"GetCaptureSizeAsync",
			"GetCaptureStorageSizeAsync",
			"RetrieveCaptures",
			"SaveCaptureToExternalStorage",
			"SaveCapturesToExternalStorageAsync",
			"SaveScreenshotCapture",
			-- "PostToFeedAsync"
			"PromptSaveCapturesToGallery",
			"PromptShareCapture",
		},

		MessageBusService = {
			"Call",
			"GetLast",
			"GetMessageId",
			"GetProtocolMethodRequestMessageId",
			"GetProtocolMethodResponseMessageId",
			"MakeRequest",
			"Publish",
			"PublishProtocolMethodRequest",
			"PublishProtocolMethodResponse",
			"Subscribe",
			"SubscribeToProtocolMethodRequest",
			"SubscribeToProtocolMethodResponse",
		},

		AccountService = {
			"GetCredentialsHeaders",
			"GetDeviceAccessToken",
			"GetDeviceIntegrityToken",
			"GetDeviceIntegrityTokenYield",
		},

		AvatarEditorService = {
			"NoPromptCreateOutfit",
			"NoPromptDeleteOutfit",
			"NoPromptRenameOutfit",
			"NoPromptSaveAvatar",
			"NoPromptSaveAvatarThumbnailCustomization",
			"NoPromptSetFavorite",
			"NoPromptUpdateOutfit",
			"PerformCreateOutfitWithDescription",
			"PerformDeleteOutfit",
			"PerformRenameOutfit",
			"PerformSaveAvatarWithDescription",
			"PerformSetFavorite",
			"PerformUpdateOutfit",
			"PromptCreateOutfit",
			"PromptDeleteOutfit",
			"PromptRenameOutfit",
			"PromptSaveAvatar",
			"PromptSetFavorite",
			"PromptUpdateOutfit",
			"SetAllowInventoryReadAccess",
			"PromptAllowInventoryReadAccess",
			"SignalCreateOutfitFailed",
			"SignalCreateOutfitPermissionDenied",
			"SignalDeleteOutfitFailed",
			"SignalDeleteOutfitPermissionDenied",
			"SignalRenameOutfitFailed",
			"SignalRenameOutfitPermissionDenied",
			"SignalSaveAvatarPermissionDenied",
			"SignalSetFavoriteFailed",
			"SignalSetFavoritePermissionDenied",
			"SignalUpdateOutfitFailed",
			"SignalUpdateOutfitPermissionDenied",
		},

		InsertService = {
			"GetLocalFileContents",
		},

		ContentProvider = {
			"SetBaseUrl",
		},

		UGCValidationService = {
			"FetchAssetWithFormat",
			"RegisterUGCValidationFunction",
		},

		AppUpdateService = {
			-- "DisableDUAR"
			-- "DisableDUARAndOpenSurvey"
			"PerformManagedUpdate",
		},
	},
}
