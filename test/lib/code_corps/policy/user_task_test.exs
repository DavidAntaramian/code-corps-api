defmodule CodeCorps.Policy.UserTaskTest do
  @moduledoc false

  use CodeCorps.PolicyCase

  import CodeCorps.Policy.UserTask, only: [create?: 2, update?: 2, delete?: 2]
  import CodeCorps.UserTask, only: [create_changeset: 2]

  alias CodeCorps.UserTask

  describe "create?" do
    test "returns false when user is not member of project" do
      user = insert(:user)
      task = insert(:task)

      changeset = %UserTask{} |> create_changeset(%{task_id: task.id})
      refute create?(user, changeset)
    end

    test "returns false when user is pending member of project" do
      %{project: project, user: user} = insert(:project_user, role: "pending")
      task = insert(:task, project: project)

      changeset = %UserTask{} |> create_changeset(%{task_id: task.id})
      refute create?(user, changeset)
    end

    test "returns true when user is contributor of project" do
      %{project: project, user: user} = insert(:project_user, role: "contributor")
      task = insert(:task, project: project)

      changeset = %UserTask{} |> create_changeset(%{task_id: task.id})
      assert create?(user, changeset)
    end

    test "returns true when user is admin of project" do
      %{project: project, user: user} = insert(:project_user, role: "admin")
      task = insert(:task, project: project)

      changeset = %UserTask{} |> create_changeset(%{task_id: task.id})
      assert create?(user, changeset)
    end

    test "returns true when user is owner of project" do
      %{project: project, user: user} = insert(:project_user, role: "owner")
      task = insert(:task, project: project)

      changeset = %UserTask{} |> create_changeset(%{task_id: task.id})
      assert create?(user, changeset)
    end

    test "returns true when user is author of task" do
      user = insert(:user)
      task = insert(:task, user: user)

      changeset = %UserTask{} |> create_changeset(%{task_id: task.id})

      assert create?(user, changeset)
    end
  end

  describe "update?" do
    test "returns false when user is not member of project" do
      user = insert(:user)
      task = insert(:task)

      user_task = insert(:user_task, task: task)

      refute update?(user, user_task)
    end

    test "returns false when user is pending member of project" do
      %{project: project, user: user} = insert(:project_user, role: "pending")
      task = insert(:task, project: project)

      user_task = insert(:user_task, task: task)

      refute update?(user, user_task)
    end

    test "returns true when user is contributor of project" do
      %{project: project, user: user} = insert(:project_user, role: "contributor")
      task = insert(:task, project: project)

      user_task = insert(:user_task, task: task)

      assert update?(user, user_task)
    end

    test "returns true when user is admin of project" do
      %{project: project, user: user} = insert(:project_user, role: "admin")
      task = insert(:task, project: project)

      user_task = insert(:user_task, task: task)

      assert update?(user, user_task)
    end

    test "returns true when user is owner of project" do
      %{project: project, user: user} = insert(:project_user, role: "owner")
      task = insert(:task, project: project)

      user_task = insert(:user_task, task: task)

      assert update?(user, user_task)
    end

    test "returns true when user is author of task" do
      user = insert(:user)
      task = insert(:task, user: user)

      user_task = insert(:user_task, task: task)

      assert update?(user, user_task)
    end
  end

  describe "delete?" do
    test "returns false when user is not member of project" do
      user = insert(:user)
      task = insert(:task)

      user_task = insert(:user_task, task: task)

      refute delete?(user, user_task)
    end

    test "returns false when user is pending member of project" do
      %{project: project, user: user} = insert(:project_user, role: "pending")
      task = insert(:task, project: project)

      user_task = insert(:user_task, task: task)

      refute delete?(user, user_task)
    end

    test "returns true when user is contributor of project" do
      %{project: project, user: user} = insert(:project_user, role: "contributor")
      task = insert(:task, project: project)

      user_task = insert(:user_task, task: task)

      assert delete?(user, user_task)
    end

    test "returns true when user is admin of project" do
      %{project: project, user: user} = insert(:project_user, role: "admin")
      task = insert(:task, project: project)

      user_task = insert(:user_task, task: task)

      assert delete?(user, user_task)
    end

    test "returns true when user is owner of project" do
      %{project: project, user: user} = insert(:project_user, role: "owner")
      task = insert(:task, project: project)

      user_task = insert(:user_task, task: task)

      assert delete?(user, user_task)
    end

    test "returns true when user is author of task" do
      user = insert(:user)
      task = insert(:task, user: user)

      user_task = insert(:user_task, task: task)

      assert delete?(user, user_task)
    end
  end
end
