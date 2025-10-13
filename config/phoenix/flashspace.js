async function runCommand(command, args = []) {
  return new Promise((resolve, reject) => {
    Task.run(command, args, (task) => {
      if (task.status !== 0) {
        reject(
          new Error(`Command "${command}" failed with status ${task.status}`),
        );
      }

      resolve(task.output.trim());
    });
  });
}

async function getFlashSpaceProfile() {
  return runCommand("/usr/local/bin/flashspace", ["get-profile"]);
}

async function getFlashSpaceWorkspace() {
  return runCommand("/usr/local/bin/flashspace", ["get-workspace"]);
}
