import * as core from "@actions/core";
import { rmSync, existsSync } from "fs";
import { FILES_AND_DIRS_TO_REMOVE } from "./paths.js";

class RemoveFiles {
    constructor() {
        this.filesAndDirsToRemove = FILES_AND_DIRS_TO_REMOVE;
    }

    run() {
        for (const path of this.filesAndDirsToRemove) {
            const fullPath = `${process.cwd()}/${path}`;
            if (existsSync(fullPath)) {
                try {
                    rmSync(fullPath, { recursive: true });
                    core.info(`The following path was removed: ${fullPath}`);
                } catch (error) {
                    core.error(`Failed to remove ${path}: ${error}`);
                }
            }
        }
    }
}

(function start() {
    new RemoveFiles().run();
})();
