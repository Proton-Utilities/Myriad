--!nocheck

return {
	title = "File Dialog",
	subtitle = "File-dialog related functions",
	docsUrl = "https://github.com/Proton-Utilities/Myriad/issues/18",
	tests = {
		openfiledialog = {
			subtitle = "Opens a dialog to select a single file. Returns a file object.",
			run = {
				{ label = "Basic", fn = require("@self/openfiledialog") },
				{ label = "No Options", fn = require("@self/openfiledialog_nil_options") },
				{ label = "Custom Title", fn = require("@self/openfiledialog_title") },
				{ label = "Default Path", fn = require("@self/openfiledialog_defaultpath") },
				{ label = "Filter: .txt only", fn = require("@self/openfiledialog_filter_single") },
				{ label = "Filter: .png/.jpg/.jpeg", fn = require("@self/openfiledialog_filter_multi") },
				{ label = "IsFile / IsFolder", fn = require("@self/openfiledialog_item_type") },
				{ label = "Read()", fn = require("@self/openfiledialog_read") },
				{ label = "Write() → Read() roundtrip", fn = require("@self/openfiledialog_write") },
				{ label = "Append() → Read() roundtrip", fn = require("@self/openfiledialog_append") },
				{ label = "Delete()", fn = require("@self/openfiledialog_delete") },
			},
		},
		openfilesdialog = {
			subtitle = "Opens a dialog to select multiple files. Returns an array of file objects.",
			run = {
				{ label = "Basic", fn = require("@self/openfilesdialog") },
				{ label = "No Options", fn = require("@self/openfilesdialog_nil_options") },
				{ label = "Filter: .txt / .json only", fn = require("@self/openfilesdialog_filter") },
				{
					label = "File Methods (IsFile/IsFolder/GetName/Read)",
					fn = require("@self/openfilesdialog_file_methods"),
				},
			},
		},
		openfolderdialog = {
			subtitle = "Opens a dialog to select a folder. Returns a folder object.",
			run = {
				{ label = "Basic", fn = require("@self/openfolderdialog") },
				{ label = "No Options", fn = require("@self/openfolderdialog_nil_options") },
				{ label = "IsFile / IsFolder", fn = require("@self/openfolderdialog_item_type") },
				{ label = "List()", fn = require("@self/openfolderdialog_list") },
				{ label = "List(true) vs List(false)", fn = require("@self/openfolderdialog_list_recursive") },
				{ label = "MakeFolder()", fn = require("@self/openfolderdialog_makefolder") },
				{ label = "Delete()", fn = require("@self/openfolderdialog_delete") },
			},
		},
		savefiledialog = {
			subtitle = "Opens a save dialog, writes content to the chosen path, and returns a file object.",
			run = {
				{ label = "Basic", fn = require("@self/savefiledialog") },
				{ label = "No Options", fn = require("@self/savefiledialog_nil_options") },
				{ label = "Content Written Before Return", fn = require("@self/savefiledialog_content_written") },
				{ label = "suggestedName", fn = require("@self/savefiledialog_suggestedname") },
				{ label = "defaultExtension", fn = require("@self/savefiledialog_defaultextension") },
				{ label = "IsFile / IsFolder", fn = require("@self/savefiledialog_item_type") },
				{ label = "Empty Content", fn = require("@self/savefiledialog_empty_content") },
			},
		},
	},
}
