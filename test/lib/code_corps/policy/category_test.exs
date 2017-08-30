defmodule CodeCorps.Policy.CategoryTest do
  use CodeCorps.PolicyCase

  import CodeCorps.Policy.Category, only: [create?: 1, update?: 1]

  describe "create?" do
    test "returns true when user is an admin" do
      user = build(:user, admin: true)
      assert create?(user)
    end

    test "returns false if user is not an admin" do
      user = build(:user, admin: false)
      refute create?(user) 
    end
  end

  describe "update?" do
    test "returns true when user is an admin" do
      user = build(:user, admin: true)
      assert update?(user)
    end

    test "returns false if user is not an admin" do
      user = build(:user, admin: false)
      refute update?(user)
    end
  end
end
